class FoodMailer < ApplicationMailer
  default from: "Hello.ucberkeleyfoodpantry@gmail.com"
  def send_order(user, itemList)
    @user = user
    @itemList = itemList
    mail(to: "lgy22106@gmail.com", subject: 'New Order')
  end
end
