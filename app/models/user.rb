class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts
  has_many :finance_types
  has_many :employees
  has_many :students
  has_many :tuitions
  has_many :finances

  def email_required?
    false
  end
end
