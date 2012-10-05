# == Schema Information
#
# Table name: managers
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Manager do
  it "should have clear manager <->? subordinates relationship" do
    pending "todo: Yizhen ? not sure if i have to introduce a manager-employee relation table here #{__FILE__}"
  end
end
