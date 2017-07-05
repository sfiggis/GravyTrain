Given(/^they are on the registration page$/) do
  visit '/buyers/sign_up'
end

When(/^they enter their email$/) do
  fill_in 'Email', :with => 'test@example.org'
end

When(/^they enter their password$/) do
  fill_in 'Password', :with => 'password'
end

When(/^they confirm their password$/) do
  fill_in 'Password confirmation', :with => 'password'
end

When(/^they register$/) do
  click_on 'Sign up'
end

When(/^they click on Wait I'm a Provider$/) do
 save_and_open_page
  click_on 'Wait, I\'m a Provider'
end

Then(/^they have a new buyer account$/) do
  assert_equal Buyer.count, 1
end

Then(/^they have a new provider account$/) do
  assert_equal Buyer.count, 1
  assert_equal Buyer.first.type, "Provider"
end

Then(/^they get sent to the homepage$/) do
  assert page.has_current_path? '/'
end

Then(/^they see a message welcoming them into the Gravy Train$/) do
  # save_and_open_page
  assert page.has_content?("Welcome to the Gravy Train")
end

Then(/^they receive an email asking them to confirm their email address$/) do
  assert_equal ActionMailer::Base.deliveries.length, 1
  assert_equal ActionMailer::Base.deliveries.first.subject, 'Welcome to the Gravy Train.'
end

