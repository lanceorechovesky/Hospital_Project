class AddPostdisCommitToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :postdis_commit, :text
  end
end
