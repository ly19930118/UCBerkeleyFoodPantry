
Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|I )should see links to "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then(/^I should see an? "(.*?)" section$/) do |header|
  if page.respond_to? :should
    page.should have_content(header)
  else
    assert page.has_content?(header)
  end
end

Then /^I should (not )?see an element "([^"]*)"$/ do |negate, selector|
  expectation = negate ? :should_not : :should
  page.send(expectation, have_css(selector))
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should see the page with link "(.*?)" to "(.*?)"$/ do |link, url|
  page.should have_link(link, :href => url)
end

Then /^I should( not)? see a field "([^"]*)"$/ do |negate, name|
  expectation = negate ? :should_not : :should
  begin
    field = find_field(name)
  rescue Capybara::ElementNotFound
    # In Capybara 0.4+ #find_field raises an error instead of returning nil
  end
  field.send(expectation, be_present)
end

Then /^(?:|I )should see the element "([^"]*)"$/ do |ele|
  if page.respond_to? :should
    page.should have_css('div#' + ele)
  end
end

When /^I fill out the form with the following attributes:$/ do |table|
  puts table.rows_hash
  criteria = table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
end

When /^I click the "(.*?)" button$/ do |button|
  click_button button
end

Then /^I should see "([^"]*)" button$/ do |button|
  expect have_button button
end

Then /^I should not see "([^"]*)" button$/ do |button|
  expect have_no_button button
end

Given /^I am logged in as user "([^"]*)"$/ do

end

When /^I fill in the (in)?correct admin key$/ do |incorrect|
  if incorrect == "in"
    fill_in "admin_key", :with => "INCORRECT"
  else
    fill_in "admin_key", :with => "UCBERKELEYFOODPANTRY981723"
  end
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  page.body.should_not have_content(text)
end

