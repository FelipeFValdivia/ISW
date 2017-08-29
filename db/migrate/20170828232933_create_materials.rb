class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.text :description
      t.integer :learning_type
      t.references :content

      t.timestamps null: false
    end
  end
end
