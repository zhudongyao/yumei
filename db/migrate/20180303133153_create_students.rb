class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string    :name,                         comment: "姓名"
      t.date      :born_at,                      comment: "出生日期"
      t.string    :parent_name,                  comment: "家长姓名"
      t.string    :mobile,                       comment: "家长联系方式"
      t.string    :address,                      comment: "家庭住址"
      t.string    :remark,                       comment: "备注"
      t.string    :status,                       comment: "学员状态"
      t.integer   :cost_count,    default: 0,    comment: "缴费学期数"
      t.text      :description,                  comment: "描述"
      t.integer   :user_id,                      comment: "创建人id"
      t.timestamps
    end
  end
end
