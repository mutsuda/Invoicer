class CreateBlips < ActiveRecord::Migration
  def self.up
    create_table :blips do |t|
      t.integer :invoice_id
      t.date :date
      t.string :description
      t.float :ppu
      t.integer :qtt
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :blips
  end
end
