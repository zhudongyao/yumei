class FinanceType < ApplicationRecord
  belongs_to :user

  STATUS = {1 => "使用中", 0 => "禁用"}
end
