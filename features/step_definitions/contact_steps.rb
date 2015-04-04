Given /the following contact page exists/ do |contacts_table|
  	contacts_table.hashes.each do |contact|
    Contact.create(email: contact['email'], facebook: contact['facebook'], location: contact['location'], hours: contact['hours'])
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end
