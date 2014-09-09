class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :patient_id
      t.integer :dose
      t.boolean :restricted
      t.timestamps
    end
  end
end
