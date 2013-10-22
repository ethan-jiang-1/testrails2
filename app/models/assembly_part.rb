# == Schema Information
#
# Table name: assembly_parts
#
#  id          :integer          not null, primary key
#  assembly_id :integer
#  part_id     :integer
#

class AssemblyPart < ActiveRecord::Base
  belongs_to :assembly
  belongs_to :part
  # attr_accessible :title, :body
end
