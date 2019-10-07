class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.int :id
      t.varchar(45) :name
      t.text :content
      t.float :price
      t.int :count

      t.timestamps
    end
  end
end
