class CreateTuitions < ActiveRecord::Migration[5.0]
  def change
    create_table :tuitions do |t|

      t.timestamps
    end
  end
end
