class Finance < ApplicationRecord
  belongs_to :tuitions
  belongs_to :finance_type
  belongs_to :account
  belongs_to :user

  scope :usable, -> { where(:status => 1)}
  STATUS = {1 => "使用中", 0 => "禁用"}

  before_save :update_info

  def update_info
    self.finance_type_name = self.finance_type.try(:name)
    self.index_day = self.happened_at.index_day
    self.index_month = self.happened_at.index_month
    self.index_year = self.happened_at.index_year
  end
end
