class Account < ApplicationRecord
  belongs_to :user
  has_many :tuitions
  has_many :finances

  scope :usable, -> { where(:status => 1)}
  STATUS = {1 => "使用中", 0 => "禁用"}

  def income_total
    self.finances.usable.is_income.sum(:total)
  end

  def expense_total
    self.finances.usable.is_expense.sum(:total)
  end

  def remain_money
    self.initial_total + self.income_total - self.expense_total
  end

end
