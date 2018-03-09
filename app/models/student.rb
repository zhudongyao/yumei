class Student < ApplicationRecord
  has_many :tuitions
  has_many :finances

end
