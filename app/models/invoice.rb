class Invoice < ActiveRecord::Base
  belongs_to :client
  has_many :blips
  
  before_create :materialize_client
  before_create :materialize_impost
    
  def base_price
    return blips.map{|b| b.total}.sum
  end
 
 
  def iva_price
    return self.iva*base_price
  end
  
  def irpf_price
    return self.irpf*base_price
  end
  
  def invoice_total
    return base_price+iva_price-irpf_price
  end
 
  private
    def materialize_client
      self.client_name = client.name
      self.client_address = client.address
      self.client_zip = client.zip
      self.client_poblacio = client.poblacio
      self.client_ciutat = client.city
      self.client_nif = client.nif
      self.iva = 0.18
      self.irpf = 0.15
    end
  
    def materialize_impost
      self.iva = 0.18
      self.irpf = 0.15
    end
  
  

  
  
  
  
  
end
