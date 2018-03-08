class CreateTuition < ActiveRecord::Migration[5.0]
  def change
    create_table :tuitions do |t|
      t.integer   :student_id,                             comment: "学生ID"
      t.decimal   :total,    precision: 20, scale: 4,      comment: "收款金额"
      t.date      :happened_at,                            comment: "收费日期"
      t.string    :remark,                                 comment: "收款描述"
      t.integer   :account_id,                             comment: "收费账户"
      t.integer   :employee_id,                            comment: "收款员工"
      t.integer   :finance_type_id,                        comment: "收支类型ID"
      t.string    :student_status,                         comment: "学生状态"
      t.integer   :status,        default: 1,              comment: "状态"
      t.integer   :user_id,                                comment: "创建人ID"

      t.timestamps
    end
  end
end
