require('spec_helper')

describe("the store user path", {:type => :feature}) do
  it("shows all stores") do
    visit('/')
    click_link('View All Stores')
    expect(page).to have_content('stores')
  end
end
