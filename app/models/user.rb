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
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
 
  validates       :name, :presence => true,
                  :length => { :maximum => 50 }

  validates       :email, :presence => true,
                          :format   => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }

  validates       :password, :presence => true,
                  :confirmation => true,
                  :length       => { :within => 6..40 }

before_save :encrypt_password

def has_password?(submitted_password)
 encrypted_password == encrypt(submitted_password)
end

def self.authenticate(email, submitted_password)
 user = find_by_email(email)
 return nil if user.nil?
 return user if user.has_password?(submitted_password)
end 

def self.authenticate_with_salt(id,cookie_salt)
 user = find_by_id(id)
 return nil if user.nil?
 return user if user.salt == cookie_salt
end

private

def encrypt_password
 self.salt = make_salt unless has_password?(password)
 self.encrypted_password = encrypt(password)
end

def encrypt(string)
 secure_hash("#{salt}--#{string}")
end

def make_salt
 secure_hash("#{Time.now.utc}--#{password}")
end

def secure_hash(string)
 Digest::SHA2.hexdigest(string)
end

 

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
