class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string   :name,                             comment: "姓名"
      t.string   :mobile,                           comment: "电话"
      t.string   :department,                       comment: "部门，岗位"
      t.decimal  :salary, precision: 20, scale: 4,  comment: "工资"
      t.datetime :born_at,                          comment: "出生日期"
      t.datetime :join_at,                          comment: "入职日期"
      t.datetime :leave_at,                         comment: "离职日期"
      t.string   :leave_reason,                     comment: "离职原因"
      t.integer  :status,          default: 1,      comment: "状态"
      t.string   :emergent_person,                  comment: "紧急联系人"
      t.string   :emergent_mobile,                  comment: "紧急联系人电话"
      t.integer  :user_id,                          comment: "创建人id"
      t.timestamps
    end
  end
end
