class Employee < ApplicationRecord
  belongs_to :user
  has_many :tuition

  scope :usable, -> { where(:status => 1)}

  STATUS = {1 => "在职", 0 => "离职"}

end
