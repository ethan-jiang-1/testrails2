# == Schema Information
#
# Table name: appointments
#
#  id               :integer          not null, primary key
#  physician_id     :integer
#  patient_id       :integer
#  appointment_date :datetime
#

class Appointment < ActiveRecord::Base
  belongs_to :physician
  belongs_to :patient
  attr_accessible :appointment_date
  attr_accessible :physician_id, :patient_id    #enable Rail_Admin to access the associations

  validates_associated :physician, :patient
  validates_presence_of :appointment_date
end
