# Preview all emails at http://localhost:3000/rails/mailers/food_mailer
class FoodMailerPreview < ActionMailer::Preview
    def send_order
        FoodMailer.send_order(User.first, [{:name => "apple", :amount => 3}, {:name => "cake", :amount => 1}])
    end

end
