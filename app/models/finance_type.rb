class FinanceType < ApplicationRecord
  belongs_to :user
  has_many :tuitions
  has_many :finances

  scope :usable, -> { where(:status => 1)}
  scope :income, -> { where(kind: "收入")}
  scope :expense, -> { where(kind: "支出")}
  STATUS = {1 => "使用中", 0 => "禁用"}

  def self.finance_income_select
    FinanceType.usable.income.where.not(name: "学生学费")
  end

  def my_total
    self.finances.usable.sum(:total)
  end
end
