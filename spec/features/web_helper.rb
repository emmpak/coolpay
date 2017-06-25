def add_recipient
  visit('/')
  click_button "Make a payment"
  fill_in :recipient, with: "Bruce Wayne"
  click_button "Add Recipient"
end
