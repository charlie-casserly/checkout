require 'discount'

RSpec.describe Discount do
  context '#apply_discount' do
      let(:database_item) { 
        {
          item: :orange,
          price: 20,
          discount: nil
        }
      }

    context '#half_price' do 
      it 'reduces the price of the item by half' do
        database_item[:discount] = :half_price
        expect(Discount.apply_discount(database_item, 6)).to eq(60)
      end
    end

    context '#first_half_price' do 
      it 'reduces the price of the first occurrence of the item by half' do
        database_item[:discount] = :first_half_price
        expect(Discount.apply_discount(database_item, 6)).to eq(110)
      end
    end

    context '#two_for_one' do 
      it 'grants every other occurrence of an item for free' do
        database_item[:discount] = :two_for_one
        expect(Discount.apply_discount(database_item, 6)).to eq(60)
      end
    end

    context '#buy_three_get_one_free' do 
      it 'grants every fourth occurrence of an item for free' do
        database_item[:discount] = :buy_three_get_one_free
        expect(Discount.apply_discount(database_item, 6)).to eq(100)
      end
    end
  end
end