class Restaurant < ActiveRecord::Base
  validates_presence_of :name, :address_street, :address_city,
                        :address_state, :address_zip
end
