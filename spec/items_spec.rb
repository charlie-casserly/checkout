require 'items'

RSpec.describe Items do
  context '#initialize' do 
    let(:items) { described_class.new }

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
end