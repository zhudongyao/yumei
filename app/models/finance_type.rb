class FinanceType < ApplicationRecord
  belongs_to :user
  has_many :tuitions
  has_many :finances

  scope :usable, -> { where(:status => 1)}
  scope :income, -> { where(kind: "收入")}
  scope :expense, -> { where(kind: "支出")}
  STATUS = {1 => "使用中", 0 => "禁用"}
end
