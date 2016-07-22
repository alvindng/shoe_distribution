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

  describe('save') do
    it "validates presence of store name" do
      test_store = Store.create({:name => ''})
      expect(test_store.save()).to(eq(false))
    end
  end

  describe('name') do
    it "converts the name of the store to title case" do
      test_store = Store.create({:name => 'champs'})
      expect(test_store.name()).to(eq('Champs'))
    end
  end
end
