class User < ActiveRecord::Base
	validates :userid,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: true }
	has_secure_password
	validates :password, length: { minimum: 6 }

	@@status = ['student', 'student-parent']

	def self.status
		@@status
	end


    def self.resetOrder
      User.update_all(:orders_this_month => 0)
    end

    def increaseOrder
      self.increment!(:orders_this_month)
    end
end
