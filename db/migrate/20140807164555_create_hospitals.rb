class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :workflow_state 
      t.timestamps
    end
  end
end
