class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string   :name,                                   comment: ""
      t.string   :mobile,                             comment: ""
      t.datetime  :born_at,  comment: ""
      t.datetime  :join_at
      t.string   :salary
      t.string   :emergent_person
      t.string   :emergent_mobile
      t.string   :department
      t.datetime   :leave_at
      t.string    :operator
      t.timestamps
    end
  end
end
