class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5

      t.timestamps
    end
  end
end
