require('spec_helper')

describe Store do
  describe('brands') do
    it "returns brands associated with a store" do
      test_store = Store.create({:name => 'Champs'})
      test_brand = Brand.create({:name => 'Nike'})
      test_store.brands.push(test_brand)
      expect(test_store.brands).to(eq([test_brand]))
    end
  end
end
