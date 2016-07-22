require('spec_helper')

describe("the store user path", {:type => :feature}) do
  it("shows all stores") do
    visit('/')
    click_link('View All Stores')
    expect(page).to have_content('stores')
  end

  it('lets you add a store') do
    visit('/stores')
    test_store = Store.create({:name => 'Champs'})
    click_button('Add Store')
    expect(page).to have_content('Champs')
  end
end
