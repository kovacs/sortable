class Strongbits::ContactInfo < ActiveRecord::Base
  set_table_name 'strongbits_contact_infos'
  has_one :user, :class_name => Strongbits::User.to_s
end

# to solve circular dependency
Strongbits::User.class_eval do
  belongs_to :contact_info, :class_name => Strongbits::ContactInfo.to_s  
end