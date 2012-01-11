# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

#require 'digest/sha2'

class User < ActiveRecord::Base

email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

has_many :orders, :dependent => :destroy
has_many :carts, :dependent => :destroy
has_many :products
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
 
  validates       :name, :presence => true,
                  :length => { :maximum => 50 }

  validates       :email, :presence => true,
                          :format   => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
#validates     :password, :confirmation => true
#attr_accessor :password_confirmation
#attr_reader   :password

#validate :password_must_be_present

#def User.authenticate(name, password)
# if user = find_by_name(name)
 #  if user.hashed_password == encrypt_password(password, user.salt)
  #   user
   #  end
 # end
#end

 #def User.encrypt_password(password, salt)
  # Digest::SHA2.hexdigest(password + "wibble" + salt)
# end

# 'password' is a vrtual attribute
 #def password=(password)
  #  @password = password
   
   #  if password.present?
    #   generate_salt
     #  self.hashed_password = self.class.encrypt_password(password, salt)
    # end
  # end    

#after_destroy :ensure_an_admin_remains

#def ensure_an_admin_remains
 #if User.count.zero?
 #  raise "Can't delete last user"
  # end
 #end  

#private
 #  def password_must_be_present
  #    errors.add(:password, "Missing password") unless hashed_password.present?
   #end

  # def generate_salt
   #   self.salt = self.object_id.to_s + rand.to_s
  # end   

end
