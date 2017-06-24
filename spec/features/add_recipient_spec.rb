feature 'Add new recipient' do
  scenario 'user creates a new recipient if authorized' do
    visit('/')
    click_button "Make a payment"
    fill_in :recipient, with: "John Doe"
    click_button "Add Recipient"
    expect(current_path).to eq '/payments'
    expect(page).to have_content "John Doe"
  end
end
