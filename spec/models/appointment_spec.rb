require 'spec_helper'

describe Appointment do

  before(:each) do
    @pa1 = Patient.create!(:name => "tom")
    @pa2 = Patient.create!(:name => "mark")
    @pa3 = Patient.create!(:name => "sue")

    @ph1 = Physician.create!(:name=> "Dr.A")
    @ph2 = Physician.create!(:name=> "Dr.B")
    @ph3 = Physician.create!(:name=> "Dr.C")
  end

  it "should has Patients  & Physicians initially " do
    Patient.count.should  equal 3
    Physician.count.should equal 3
    #Appointment.count.should be 0
  end

  it "should make appointment via appointment table" do
    ap1 = Appointment.new
    ap1.patient = @pa1
    ap1.physician = @ph1
    ap1.save!

    @ph1.patients.should include @pa1
    @pa1.physicians.should include @ph1
    #Appointment.count.should be 1
  end

   it "should be able to make appointment via physician/patient tables" do
    ap2 = Appointment.new
    @ph2.patients <<  @pa2
    @pa2.physicians << @ph2
    ap2.save!

    @ph2.patients.should include @pa2
    @pa2.physicians.should include @ph2
    #Appointment.count.should be 1
  end

  it "should be able to make appointment via physician/patient tables -2" do
    ap3 = Appointment.new
    @pa3.physicians << @ph3
    @ph3.patients << @pa3
    ap3.save!

    @ph3.patients.should include @pa3
    @pa3.physicians.should include @ph3
    #Appointment.count.should be 1
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