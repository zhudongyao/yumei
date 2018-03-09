class Finance < ApplicationRecord

  belongs_to :tuitions
  belongs_to :finance_type
  belongs_to :account
  belongs_to :user
  belongs_to :student

  scope :usable, -> { where(:status => 1)}
  scope :is_income, -> {joins(:finance_type).where("finance_types.kind = '收入'")}
  scope :is_expense, -> {joins(:finance_type).where("finance_types.kind = '支出'")}
  STATUS = {1 => "有效", 0 => "无效"}

  before_save :update_info

  def update_info
    self.finance_type_name = self.finance_type.try(:name)
    self.index_day = self.happened_at.index_day
    self.index_month = self.happened_at.index_month
    self.index_year = self.happened_at.index_year
  end

  def finance_kind
    self.finance_type.try(:kind)
  end

  def show_finance_type_name
    if self.student.present?
      return self.finance_type_name.to_s + '(' + self.student.name.to_s + ')'
    else
      return self.finance_type_name
    end
  end

end
