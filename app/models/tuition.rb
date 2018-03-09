class Tuition < ApplicationRecord
  belongs_to :student
  belongs_to :account
  belongs_to :employee
  belongs_to :user
  belongs_to :finance_type
  has_one :finance

  scope :usable, -> { where(:status => 1)}
  STATUS = {1 => "有效", 0 => "无效"}

  before_create :create_info
  after_create :create_finance
  after_save :update_student_status

  def create_info
    self.finance_type_id = FinanceType.find_by(name: "学生学费").try(:id)
    year = self.happened_at.index_year.to_s
    season = self.happened_at.month < 6 ? '春' : '秋'
    self.student_status = year + season + '季学员' if year.present? && season.present?
  end

  def create_finance
    Finance.create(tuition_id: self.id, student_id: self.student_id, total: self.total, happened_at: self.happened_at, remark: self.remark, account_id: self.account_id, finance_type_id: self.finance_type_id, user_id: self.user_id)
  end

  def update_student_status
    if self.student_status.present?
      student = self.student
      student.update(cost_count: student.tuitions.usable.count)
      latest_status = student.tuitions.usable.sort_by{|x| x.happened_at}.reverse.first.student_status if student.tuitions.usable.present?
      student.update(status: latest_status) if latest_status.present?
    end
  end

end
