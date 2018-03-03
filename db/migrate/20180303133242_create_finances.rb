class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.integer :finance_type_id
      t.string :finance_type
      t.datetime :happened_at
      t.decimal :total
      t.integer :account_id
      t.string :operator
      t.integer :status,default: 1
      t.text :remark
      t.string :canceled_by
      t.datetime :canceled_at
      t.text :reason
      t.integer :student_id
      t.integer :teacher_id
      t.timestamps
    end
  end
end
