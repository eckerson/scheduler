##TODO: Setup support file to load data into the test database

#Scenario: Create Valid Location
Given /^I have no locations$/ do
  Location.delete_all
end

Given /^I am on the list of locations$/ do
  visit "/locations"
end

When /^I follow "(.*?)"$/ do |link|
  click_link( link )
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in( "location_" + field, :with => value )
end

When /^I press "(.*?)"$/ do |button|
  click_button( button )
end

Then /^I should see "(.*?)"$/ do |string|
  page.should have_content( string )
end

Then /^I should have (\d+) location$/ do |count|
  Location.count.should == count.to_i
end

#Scenario: Edit Valid Location
Given /^I have a location named "(.*?)"$/ do |location_name|
  #visit path_to( location_name )
  visit edit_location_path( Location.find_by_name( location_name ) )
end

Then /^the location should have an address(\d+) of "(.*?)"$/ do |addressFieldNumber, value|
  pending # express the regexp above with the code you wish you had
end