class Client < ActiveRecord::Base
  has_many :invoices
  
  validates :nif, :nif => true
  
end
