class CreateTeleporters < ActiveRecord::Migration
  def change
    create_table :teleporters do |t|
      t.integer :number
      t.string :departure
      t.string :destination

      t.timestamps
    end
  end
end
