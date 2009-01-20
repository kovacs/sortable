class Strongbits::User < ActiveRecord::Base
  set_table_name 'strongbits_users'
  
  def name
    self.contact_info.name
  end
end