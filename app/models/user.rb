class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  		 #:registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

         # recoverable: send mail for recover user:password
         # registerable: enable/disable register
end
