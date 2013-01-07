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
