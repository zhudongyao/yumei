class CreateFinance < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.string     :finance_type_name,                  comment: "收支类型"
      t.decimal    :total,   precision: 20, scale: 4,   comment: "金额"
      t.date       :happened_at,                        comment: "收支时间"
      t.text       :remark,                             comment: "描述"
      t.integer    :status,   default: 1,               comment: "状态"

      t.integer    :finance_type_id,                    comment: "收支类型ID"
      t.integer    :account_id,                         comment: "收支账户ID"
      t.integer    :user_id,                            comment: "创建人ID"
      t.integer    :canceled_user_id,                   comment: "取消人ID"
      t.date      :canceled_at,                        comment: "取消时间"
      t.text       :canceled_reason,                    comment: "取消原因"
      t.integer    :tuition_id,                         comment: "学费表ID"
      t.integer    :student_id,                         comment: "学生ID"
      t.integer    :employee_id,                        comment: "员工ID"

      t.integer    :index_year,                         comment: "收支发生年度"
      t.integer    :index_month,                        comment: "收支发生月度"
      t.integer    :index_day,                          comment: "收支发生日期"
      t.timestamps
    end

      add_index :finances, :index_year
      add_index :finances, :index_month
      add_index :finances, :index_day
  end
end
