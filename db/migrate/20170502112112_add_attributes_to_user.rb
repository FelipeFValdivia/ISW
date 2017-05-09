class AddAttributesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :birth_date, :date
  	add_column :users, :description, :text

  end
end
