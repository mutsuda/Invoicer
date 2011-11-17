class Invoice < ActiveRecord::Base
  belongs_to :client
  has_many :blips
  
  before_create :materialize_client
  before_create :materialize_impost
  before_create :assign_number
    
  scope :for_period, lambda {|ini, lapse| where('date >= ?', ini).where('date < ?', ini + lapse) }
  scope :for_year, lambda {|year| for_period(Date.new(year), 1.year) }
  scope :for_year_and_month, lambda {|year, month| for_period(Date.new(year, month), 1.month) }

  scope :asc, order("created_at ASC")
  
  def base_price
    return blips.map{|b| b.total}.sum
  end

  def iva_price
    self.iva*base_price
  end
  
  def irpf_price
    self.irpf*base_price
  end
  
  def invoice_total
    base_price+iva_price-irpf_price
  end
 
  private
    def materialize_client
      self.client_name = client.name
      self.client_address = client.address
      self.client_zip = client.zip
      self.client_poblacio = client.poblacio
      self.client_ciutat = client.city
      self.client_nif = client.nif
      self.iva = IVA
      self.irpf = IRPF
      self.status = 1
    end
  
    def materialize_impost
      self.iva = 0.18
      self.irpf = 0.15
    end
    
    def assign_number
        y = Time.now.year
        li = Invoice.for_year(y).asc.last
        if (li)
          lin = li.number.split("-").first.to_i
          fn = (lin + 1).to_s.rjust(3,"0")
          self.number = "#{fn}-#{y}"
        else self.number = "001-#{y}"
        end
    end
end
