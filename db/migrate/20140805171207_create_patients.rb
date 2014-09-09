class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.text :complaint
      t.string :sex
      t.string :workflow_state
      t.timestamps
    end
  end
end
