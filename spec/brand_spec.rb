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

  describe('save') do
    it "validates the presence of a brand name" do
      test_brand = Brand.create({:name => ''})
      expect(test_brand.save()).to(eq(false))
    end
  end

  describe('name') do
    it "converts the name of the brand to title case" do
      test_brand = Brand.create({:name => 'nike'})
      expect(test_brand.name()).to(eq('Nike'))
    end
  end
end
