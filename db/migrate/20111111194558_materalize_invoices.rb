class MateralizeInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :irpf, :float
    add_column :invoices, :iva, :float
    remove_column :invoices, :total
    add_column :invoices, :client_name, :string
    add_column :invoices, :client_address, :string
    add_column :invoices, :client_zip, :string
    add_column :invoices, :client_poblacio, :string
    add_column :invoices, :client_ciutat, :string
    add_column :invoices, :client_nif, :string
  end

  def self.down
    remove_column :invoices, :irpf
    remove_column :invoices, :iva
    add_column :invoices, :total, :float
    remove_column :invoices, :client_name
    remove_column :invoices, :client_address
    remove_column :invoices, :client_zip
    remove_column :invoices, :client_poblacio
    remove_column :invoices, :client_ciutat
    remove_column :invoices, :client_nif
  end
end
