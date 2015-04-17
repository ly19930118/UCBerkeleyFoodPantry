class User < ActiveRecord::Base
	validates :userid,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }

end
