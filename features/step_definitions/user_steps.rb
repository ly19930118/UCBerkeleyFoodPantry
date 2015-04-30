Given /the following admin users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(userid: user['userid'], orders_this_month: user['orders_this_month'], password: user['password'], admin: true)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

Given /the following non admin users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(userid: user['userid'], orders_this_month: user['orders_this_month'], password: user['password'], admin: false)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end