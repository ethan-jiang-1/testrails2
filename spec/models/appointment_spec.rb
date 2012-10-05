require 'spec_helper'


describe Appointment do
  it "should make appointment via appointment table" do
    @pa1 = Patient.create!(:name => "tom")
    @ph1 = Physician.create!(:name=> "Dr.A")

    ap1 = FactoryGirl.build(:appointment)
    ap1.patient = @pa1
    ap1.physician = @ph1
    ap1.save!

    @ph1.patients.should include @pa1
    @pa1.physicians.should include @ph1
  end

end


describe Appointment do
  before(:each) do
    @pa1 = FactoryGirl.create(:patient)
    @pa2 = FactoryGirl.create(:patient)
    @pa3 = FactoryGirl.create(:patient)
    @ph1 = FactoryGirl.create(:physician)
  end

  it "make 3 appointments by using factory_girl" do
    ap1 = FactoryGirl.build(:appointment)
    ap1.patient = @pa1
    ap1.physician = @ph1
    ap1.save!

    ap2 = FactoryGirl.build(:appointment)
    ap2.patient = @pa2
    ap2.physician = @ph1
    ap2.save!

    ap3 = FactoryGirl.build(:appointment)
    ap3.patient = @pa3
    ap3.physician = @ph1
    ap3.save!

    @ph1.patients.should include @pa1
    @ph1.patients.should include @pa2
    @ph1.patients.should include @pa3

    @pa1.physicians.should include @ph1
    @pa2.physicians.should include @ph1
    @pa3.physicians.should include @ph1

  end

end