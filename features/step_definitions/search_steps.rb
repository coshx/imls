Given /^I search for a keyword$/ do
  @keyword = 'Medicine'
  visit root_path
  fill_in "q", :with => @keyword
  click_button "search"
end

Then /^I should see results containing that keyword$/ do
  page.find(".document").should have_content @keyword
end