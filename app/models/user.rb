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
  scope :usable, -> { where(:status => 1)}
  STATUS = {1 => "使用中", 0 => "禁用"}

  def email_required?
    false
  end
end
