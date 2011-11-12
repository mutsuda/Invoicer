class Blip < ActiveRecord::Base
  belongs_to :invoice
  
  
  def total
    return self.qtt * self.ppu
  end
end
