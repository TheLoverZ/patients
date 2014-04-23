class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthday
      t.string :medical_number
      t.string :gender
      t.string :status
      t.integer :location_id
      t.integer :view_count

      t.timestamps
    end
  end
end
