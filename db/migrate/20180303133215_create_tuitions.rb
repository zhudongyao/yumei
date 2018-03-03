class CreateTuitions < ActiveRecord::Migration[5.0]
  def change
    create_table :tuitions do |t|
      t.integer :student_id
      t.integer :account_id
      t.decimal :total
      t.datetime :happened_at
      t.integer :teacher_id
      t.integer :student_status
      t.integer :finance_id
      t.integer :status
      t.string :operator

      t.timestamps
    end
  end
end
