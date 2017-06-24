feature 'Authenticate user' do
  scenario 'get a coolpay token' do
    visit '/'
    click_button "Make a payment"
    expect(current_path).to eq '/payments'
    expect(page).to have_content 'Hello Emil.'
  end
end
