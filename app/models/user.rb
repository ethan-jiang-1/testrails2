# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'mp_user_traceable'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessible :name


  #access-current-user-in-model
  #find the practice here: http://stackoverflow.com/questions/2513383/access-current-user-in-model
  def self.mp_get_current_user
    Thread.current[:mp_current_user]
  end

  def self.mp_set_current_user usr
    begin
      Thread.current[:mp_current_user] = usr
      MpUserTraceable::UserTracer.set_current_user usr  
    rescue Exception => e
      puts "User.mp_set_current_user exception occured: " + e.message
      raise e
    end
  end
  
end
