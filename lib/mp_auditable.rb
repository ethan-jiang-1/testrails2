
require 'active_record'
require 'active_support/concern'
require 'active_support/core_ext/array/extract_options'

module MpAuditable
  module Auditing
    extend ActiveSupport::Concern

    module ClassMethods
      attr_writer :audited_attributes

      # Get the list of methods to track over record saves, including those inherited from parent
      def audited_attributes
        attrs =  @audited_attributes || []
        # handle STI case: include parent's audited_attributes
        if superclass != ActiveRecord::Base and superclass.respond_to?(:audited_attributes)
          attrs.push(*superclass.audited_attributes)
        end
        attrs
      end

      # Set the list of methods to track over record saves
      #
      # Example:
      #
      #   class Survey < ActiveRecord::Base
      #     audit :page_count, :question_ids
      #   end
      def audit(*args)

        #debugger

        options = args.extract_options!
        options[:class_name] ||= "MpAuditable::Audit"
        options[:as] = :auditable
        has_many :audits, options
        after_create  {|record| record.snap!(:action => "create")}
        after_update  {|record| record.snap!(:action => "update")}
        after_destroy {|record| record.snap!(:action => "destroy")}

        self.audited_attributes = Array.wrap args
      end
    end

    # INSTANCE METHODS

    attr_accessor :changed_by, :audit_action, :audit_tag

    # Get the latest audit record
    def last_audit
      audits.last
    end

    # Mark the latest record with a tag in order to easily find and perform diff against later
    # If there are no audits for this record, create a new audit with this tag
    def audit_tag_with(tag)
      if last_audit
        last_audit.update_attribute(:tag, tag)
      else
        self.audit_tag = tag
        snap!
      end
    end

    # Take a snapshot of and save the current state of the audited record's audited attributes
    #
    # Accept values for :tag, :action and :user in the argument hash. However, these are overridden by the values set by the auditable record's virtual attributes (#audit_tag, #audit_action, #changed_by) if defined
    def snap!(options = {})

      #debugger

      snap = {}.tap do |s|
        self.class.audited_attributes.each do |attr|
          s[attr.to_s] = self.send attr
        end
      end

      last_saved_audit = audits.last

      # build new audit
      audit = audits.build(options.merge :modifications => snap)
      audit.tag = self.audit_tag if audit_tag
      audit.action = self.audit_action if audit_action
      audit.changed_by = self.changed_by if changed_by

      # only save if it's different from before
      if !audit.same_audited_content?(last_saved_audit)
        audit.save
      else
        audits.delete(audit)
      end
    end

    # Get the latest changes by comparing the latest two audits
    def audited_changes(options = {})
      audits.last.try(:latest_diff, options) || {}
    end

    # Return last attribute's change
    #
    # This method may be slow and inefficient on model with lots of audit objects.
    # Go through each audit in the reverse order and find the first occurrence when
    # audit.modifications[attribute] changed
    def last_change_of(attribute)
      raise "#{attribute} is not audited for model #{self.class}. Audited attributes: #{self.class.audited_attributes}" unless self.class.audited_attributes.include? attribute.to_sym
      attribute = attribute.to_s # support symbol as well
      last = audits.size - 1
      last.downto(1) do |i|
        if audits[i].modifications[attribute] != audits[i-1].modifications[attribute]
          return audits[i].diff(audits[i-1])[attribute]
        end
      end
      nil
    end
  end

  class Audit < ActiveRecord::Base
    belongs_to :auditable, :polymorphic => true
    belongs_to :user, :polymorphic => true
    serialize :modifications

    attr_accessible :action, :modifications

    # Diffing two audits' modifications
    #
    # Returns a hash containing arrays of the form
    #   {
    #     :key_1 => [<value_in_other_audit>, <value_in_this_audit>],
    #     :key_2 => [<value_in_other_audit>, <value_in_this_audit>],
    #     :other_audit_own_key => [<value_in_other_audit>, nil],
    #     :this_audio_own_key  => [nil, <value_in_this_audit>]
    #   }
    def diff(other_audit)
      other_modifications = other_audit ? other_audit.modifications : {}

      {}.tap do |d|
        # find keys present only in this audit
        (self.modifications.keys - other_modifications.keys).each do |k|
          d[k] = [nil, self.modifications[k]] if self.modifications[k]
        end

        # find keys present only in other audit
        (other_modifications.keys - self.modifications.keys).each do |k|
          d[k] = [other_modifications[k], nil] if other_modifications[k]
        end

        # find common keys and diff values
        self.modifications.keys.each do |k|
          if self.modifications[k] != other_modifications[k]
            d[k] = [other_modifications[k], self.modifications[k]]
          end
        end
      end
    end

    # Diff this audit with the one created immediately before it
    #
    # See #diff for more details
    def latest_diff(options = {})
      if options.present?
        scoped = auditable.audits.order("id DESC")
        if tag = options.delete(:tag)
          scoped = scoped.where(:tag => tag)
        end
        if changed_by = options.delete(:changed_by)
          scoped = scoped.where(:user_id => changed_by.id, :user_type => changed_by.class.name)
        end
        if audit_tag = options.delete(:audit_tag)
          scoped = scoped.where(:tag => audit_tag)
        end
        diff scoped.first
      else
        diff_since(created_at)
      end
    end

    # Diff this audit with the latest audit created before the `time` variable passed
    def diff_since(time)
      other_audit = auditable.audits.where("created_at <= ? AND id != ?", time, id).order("id DESC").limit(1).first
      diff(other_audit)
   end

    # Returns user object
    #
    # Use same method name like in update_attributes:
    alias_attribute :changed_by, :user

    def same_audited_content?(other_audit)
      other_audit and relevant_attributes == other_audit.relevant_attributes
    end

    def relevant_attributes
      attributes.slice("modifications", "tag", "action", "user").reject {|k,v| v.blank? }
    end
  end
end

ActiveRecord::Base.send :include, MpAuditable::Auditing