class Moderator < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable
end
