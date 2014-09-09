class AddRollAndNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :nickname, :string
  end
end
