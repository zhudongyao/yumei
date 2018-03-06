class CreateFinanceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :finance_types do |t|
      t.string  :name,                            comment: '收支类型名称'
      t.string  :kind,                            comment: '收支类型：收入/支出'
      t.integer :status,      default: 1,         comment: "状态"
      t.integer :user_id,                         comment: '创建用户id'

      t.timestamps
    end
  end
end
