require 'items'

RSpec.describe Items do
  let(:items) { described_class.new }

  context '#initialize' do 
    it 'initializes with @prices instance variable that has six entries of items with their prices and discounts' do
      expect(items.prices).to eq([
        { 
          item: :pineapple,
          price: 100,
          discount: :first_half_price
        },
        {
          item: :apple,
          price: 10,
          discount: :two_for_one
        },
        {
          item: :orange,
          price: 20,
          discount: nil
        },
        {
          item: :pear,
          price: 15,
          discount: :two_for_one
        },
        {
          item: :banana,
          price: 30,
          discount: :half_price
        },
        {
          item: :mango,
          price: 200,
          discount: :buy_three_get_one_free
        }
      ])
    end
  end

  context '#create' do
    it 'adds a new record to the items table' do 
      items.create(item: :grapes, price: 50, discount: nil)
      expect(items.prices.last[:item]).to eq(:grapes)
    end
  end 

  context '#update' do 
    it 'updates the item in the database with the parameters passed in' do 
      items.update(item: :mango, discount: :half_price)
      expect(items.prices.last[:discount]).to eq(:half_price)
    end
  end 

  context '#delete' do 
    it 'deletes the entry that matches the item parameter' do 
      items.delete(:pineapple)
      expect(items.prices).to_not include(
        { 
          item: :pineapple,
          price: 100,
          discount: :first_half_price
        }
      )
    end
  end
end