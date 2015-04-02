class User < ActiveRecord::Base
	before_save { self.userid = userid.downcase }
	validates :userid,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
end
