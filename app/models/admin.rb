class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,:rememberable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  # :recoverable, validatable
  
  devise :database_authenticatable, :timeoutable, :lockable,
         :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
