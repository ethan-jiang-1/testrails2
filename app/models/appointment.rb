# == Schema Information
#
# Table name: appointments
#
#  id               :integer          not null, primary key
#  physician_id     :integer
#  patient_id       :integer
#  appointment_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Appointment < ActiveRecord::Base
  belongs_to :physician
  belongs_to :patient
  attr_accessible :appointment_date

  validates_associated :physician, :patient
  validates_presence_of :appointment_date
end
