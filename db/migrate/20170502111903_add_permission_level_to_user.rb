class AddPermissionLevelToUser < ActiveRecord::Migration
  def change
  	add_column :users, :permission_level, :string
  end
end
