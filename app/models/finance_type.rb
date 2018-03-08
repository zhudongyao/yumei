class FinanceType < ApplicationRecord
  belongs_to :user
  has_many :tuition
  has_many :finance

  STATUS = {1 => "使用中", 0 => "禁用"}
end
