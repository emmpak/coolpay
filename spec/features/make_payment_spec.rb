feature 'Make a payment' do
  scenario 'is able to pay one of the existing recipients' do
    visit('/')
    click_button('Make a payment')
    within '#paymentform-1' do
      fill_in :amount, with: 100
      select 'GBP', from: 'currency'
      click_button "Send coins"
    end
    expect(current_path).to eq '/payments'
    expect(page).to have_content "You successfuly transferred coins."
  end
end
