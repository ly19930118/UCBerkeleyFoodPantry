Given /the following contact information exists/ do |contacts_table|
  	contacts_table.hashes.each do |contact|
    Contact.create(email: contact['email'], facebook: contact['facebook'], location: contact['location'], hours: contact['hours'])
  end
end
