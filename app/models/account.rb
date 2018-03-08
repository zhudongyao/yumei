class Account < ApplicationRecord
  belongs_to :user
  has_many :tuition

  scope :usable, -> { where(:status => 1)}
  STATUS = {1 => "使用中", 0 => "禁用"}

end
