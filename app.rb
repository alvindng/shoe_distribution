require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

post('/stores') do
  store_name = params.fetch('store_name')
  @store = Store.create({:name => store_name})
  redirect('/stores')
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @brands = Brand.all()
  erb(:store)
end

patch('/stores/:id/brand') do
  @store = Store.find(params.fetch('id').to_i)
  brand = Brand.find(params.fetch('brand'))
  @store.brands.push(brand)
  redirect('/stores/'.concat(@store.id().to_s()))
end

post('/stores/:id/brand/new') do
  brand_name = params.fetch('brand_name')
  brand = Brand.create({:name => brand_name})
  @store = Store.find(params.fetch('id').to_i)
  @store.brands.push(brand)
  redirect('/stores/'.concat(@store.id().to_s()))
end

patch('/stores/:id') do
  new_store_name = params.fetch('new_store_name')
  @store = Store.find(params.fetch('id').to_i)
  @store.update({:name => new_store_name})
  redirect('/stores/'.concat(@store.id().to_s()))
end

delete ('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  @store.delete()
  redirect ('/stores')
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

post('/brands') do
  brand_name = params.fetch('brand_name')
  @brand = Brand.create({:name => brand_name})
  redirect('/brands')
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i)
  @stores = Store.all()
  erb(:brand)
end

post('/brands/:id/store/new') do
  store_name = params.fetch('store_name')
  store = Store.create({:name => store_name})
  @brand = Brand.find(params.fetch('id').to_i)
  @brand.stores.push(store)
  redirect('/brands/'.concat(@brand.id().to_s()))
end
