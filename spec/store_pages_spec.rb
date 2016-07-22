require('spec_helper')

describe("the store user path", {:type => :feature}) do
  it("shows all stores") do
    visit('/')
    click_link('View All Stores')
    expect(page).to have_content('stores')
  end

  it('lets you add a store') do
    visit('/stores')
    fill_in('store_name', :with => 'Champs')
    click_button('Add Store')
    expect(page).to have_content('Champs')
  end

  it('lets you add a brand to the store') do
    test_store = Store.create({:name => 'Champs'})
    visit('/stores')
    click_link('Champs')
    fill_in('brand_name', :with => "Nike")
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end

  it('lets you edit the store name') do
    test_store = Store.create({:name => 'Champs'})
    visit('/stores')
    click_link('Champs')
    fill_in('new_store_name', :with => "Nike Town")
    click_button('Update Store')
    expect(page).to have_content('Nike Town')
  end
end
