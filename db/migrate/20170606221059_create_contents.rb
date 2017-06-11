class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
    	t.string :name
    	t.references :course, index: true
    	t.text :description
      t.timestamps null: false
    end
  end
end
