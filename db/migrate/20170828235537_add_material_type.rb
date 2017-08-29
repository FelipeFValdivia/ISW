class AddMaterialType < ActiveRecord::Migration
  def change
  	add_column :materials, :material_type, :string
  end
end
