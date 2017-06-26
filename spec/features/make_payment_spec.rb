feature 'Make a payment' do
  scenario 'is able to pay one of the existing recipients' do
    visit('/')
    click_button('Make a payment')
    within '#paymentform-1' do
      fill_in :amount, with: 1000
      select 'GBP', from: 'currency'
      click_button "Send coins"
    end
    expect(current_path).to eq '/payments'
    expect(page).to have_content "1000 GBP"
  end
end
