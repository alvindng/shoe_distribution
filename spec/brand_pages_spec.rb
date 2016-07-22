require('spec_helper')

describe("the brand user path", {:type => :feature}) do
  it("shows all brands") do
    visit('/')
    click_link('View All Brands')
    expect(page).to have_content('brands')
  end
end
