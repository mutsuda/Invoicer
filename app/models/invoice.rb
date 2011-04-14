class Invoice < ActiveRecord::Base
  belongs_to :client
end
