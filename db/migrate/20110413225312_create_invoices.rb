class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string :number
      t.date :date
      t.text :comment
      t.float :base
      t.float :total

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
