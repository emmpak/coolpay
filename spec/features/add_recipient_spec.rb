feature 'Add new recipient' do
  scenario 'user creates a new recipient if authorized' do
    add_recipient
    expect(current_path).to eq '/payments'
    expect(page).to have_content "John Doe"
  end
end
