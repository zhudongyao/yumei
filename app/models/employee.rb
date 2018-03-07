class Employee < ApplicationRecord
  belongs_to :user

  STATUS = {1 => "在职", 0 => "离职"}

end
