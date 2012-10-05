# == Schema Information
#
# Table name: assembly_parts
#
#  id          :integer          not null, primary key
#  assembly_id :integer
#  part_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe AssemblyPart do
  it "should make appointment via appointment table" do
    p1 = FactoryGirl.create(:part)
    p2 = FactoryGirl.create(:part)
    a1 = FactoryGirl.create(:assembly)
    a2 = FactoryGirl.create(:assembly)

    ap1 = AssemblyPart.new
    ap1.part = p1
    ap1.assembly = a1
    ap1.save!

    ap2 = AssemblyPart.new
    ap2.part = p2
    ap2.assembly = a2
    ap2.save!

    ap3 = AssemblyPart.new
    ap3.part = p2
    ap3.assembly = a1
    ap3.save!


    AssemblyPart.find_all_by_assembly_id(a1.id).size.should be 2
    AssemblyPart.find_all_by_assembly_id(a2.id).size.should be 1

    AssemblyPart.find_all_by_part_id(p1.id).size.should be 1
    AssemblyPart.find_all_by_part_id(p2.id).size.should be 2


  end
end
