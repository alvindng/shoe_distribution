require('spec_helper')

describe("the brand user path", {:type => :feature}) do
  it("shows all brands") do
    visit('/')
    click_link('View All Brands')
    expect(page).to have_content('brands')
  end

  it('lets you add a brand') do
    visit('/brands')
    fill_in('brand_name', :with => 'Nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end

  it('lets you add a store for the brand') do
    test_brand = Brand.create({:name => 'Nike'})
    visit('/brands')
    click_link('Nike')
    fill_in('store_name', :with => "Champs")
    click_button('Add Store')
    expect(page).to have_content('Champs')
  end
end
