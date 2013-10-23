
require 'active_record'
require 'active_support/concern'

module MpUserTraceable
  
  #the UserTracing - as long as the model (the trail/aduit model) declare trace_current_user, 
  # the model will auto get notification about current user change, and also save the user_id in the model when audit-trail happens
  module UserTracing
    extend ActiveSupport::Concern

    #update the user_information before save, this is instance method of the model
    def update_user_info_before_save
      user = self.class.get_traced_current_user
      if user != nil
        if self.respond_to?(:user_id)
            self.user_id = user.id
        else
          puts "MpUserTraceable::UserTracing expect the model #{self.class} has :user_id" 
        end
      end  
    end   

    module ClassMethods
      #add trace_current user to a model 
      def trace_current_user
        MpUserTraceable::UserTracer.register self

        #also, the model automatically has update_user_info_before_save   
        before_save  {|record| record.update_user_info_before_save}
      end

      #get traced current user - this is class method of the model  
      def get_traced_current_user
        if !defined? @@traced_current_user 
          @@traced_current_user = nil 
        end
        @@traced_current_user  
      end

      #get notification to change the user in the class  - this is class method of the model
      def set_traced_current_user user
        @@traced_current_user = user
        if user != nil 
          if !user.respond_to?(:id) 
            @@traced_current_user = nil 
            puts "MpUserTraceable::UserTracing expect user model has both :id"
          end 
        end  
      end
    end
  end

  #the tracer - who figure out which model has interest to trace the current user 
  #and also notify the model when current user has been changed  
  class UserTracer
    def self.initialize
      @models = []
    end

    def self.register a_model
      @models ||= []
      @models << a_model 
    end 

    def self.set_current_user user

       @models.each {|m| notify_current_user_change(m, user) } 
    end 

    def self.notify_current_user_change model, user
      if model.respond_to?(:set_traced_current_user)
        model.set_traced_current_user user
      else
        puts "MpUserTraceable::UserTracer expect :set_traced_current_user exposed in model" 
      end  
    end 
  end

end

ActiveRecord::Base.send :include, MpUserTraceable::UserTracing