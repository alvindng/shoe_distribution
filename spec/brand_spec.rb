require('spec_helper')

describe Brand do
  describe('stores') do
    it "returns stores associated with a store" do
      test_store = Store.create({:name => 'Champs'})
      test_brand = Brand.create({:name => 'Nike'})
      test_brand.stores.push(test_store)
      expect(test_brand.stores).to(eq([test_store]))
    end
  end
end
