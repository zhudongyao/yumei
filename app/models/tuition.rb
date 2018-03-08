class Tuition < ApplicationRecord
  belongs_to :student
  belongs_to :account
  belongs_to :employee
  belongs_to :user
  belongs_to :finance_type
  has_one :finance

  STATUS = {1 => "有效", 0 => "无效"}

  before_create :create_finance_type_id
  after_create :create_finance
  after_save :update_student_status

  def create_finance_type_id
    self.finance_type_id = FinanceType.find_by(name: "学生学费").try(:id)
  end

  def create_finance
    Finance.create(tuition_id: self.id, student_id: self.student_id, total: self.total, happened_at: self.happened_at, remark: self.remark, account_id: self.account_id, finance_type_id: self.finance_type_id, user_id: self.user_id)
  end

  def update_student_status
    # self.student.update(status: self.student_status)
  end

end
