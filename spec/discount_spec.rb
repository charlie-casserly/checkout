require 'discount'

RSpec.describe Discount do 
  let(:discount) { described_class.new(items)}
  let(:items) { double(:items, prices: [
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
    ]
  )
}

  context '#update_discount' do 
    it 'adds the half price discount to oranges' do
      discount.update_discount(:orange, :half_price)
      expect(discount.items.prices[2][:discount]).to eq(:half_price)
    end
  end

  context 'applying discount' do
      let(:database_item) { 
        {
          item: :orange,
          price: 20,
          discount: nil
        }
      }

    context '#half_price' do 
      it 'reduces the price of the item by half' do
        expect(discount.half_price(database_item, 6)).to eq(60)
      end
    end
  end
end