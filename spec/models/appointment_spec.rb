require 'spec_helper'

describe Appointment do

  it "should have some patients in table" do
    p1 = Patient.create!(:name => "tom")
    p2 = Patient.create!(:name => "mark")
    p3 = Patient.create!(:name => "sue")

    ph1 = Physician.create!(:name=> "Dr.A")
    ph2 = Physician.create!(:name=> "Dr.B")
    ph3 = Physician.create!(:name=> "Dr.C")

    Patient.count.should  equal 3
    Physician.count.should equal 3


    ap1 = Appointment.new
    ap1.patient = p1
    ap1.physician = ph1
    ap1.save!

    ph1.patients.should include p1
    p1.physicians.should include ph1

    ap2 = Appointment.new
    ph2.patients <<  p2
    p2.physicians << ph2
    ap2.save!

    ph2.patients.should include p2
    p2.physicians.should include ph2

    ap3 = Appointment.new
    p3.physicians << ph3
    ph3.patients << p3
    ap3.save!

    ph3.patients.should include p3
    p3.physicians.should include ph3

    Appointment.count.should be >= 3

  end
  pending "add some examples to (or delete) #{__FILE__}"
end
