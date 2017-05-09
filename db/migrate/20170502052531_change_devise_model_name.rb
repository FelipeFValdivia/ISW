class ChangeDeviseModelName < ActiveRecord::Migration
  def self.up
    rename_table :models, :users
  end

  def self.down
    rename_table :models, :users
  end
end
