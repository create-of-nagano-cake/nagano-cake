class Address < ApplicationRecord
  
  enum address: { current_customer: 0, address: 1, new_address: 2 }
  
  belongs_to :customer
  
  def address_display
    '〒' + postal_code + ' ' + address + '' + name
  end  
  
end
