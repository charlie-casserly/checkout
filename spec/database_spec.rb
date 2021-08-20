require 'database'

RSpec.describe Database do
  let(:database) { described_class.new }

  context '#initialize' do
    it 'initializes with @items instance variable that has six entries of database with their items and discounts' do
      expect(database.items).to eq([
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
    it 'adds a new record to the database table' do
      database.create(item: :grapes, price: 50, discount: nil)
      expect(database.items.last[:item]).to eq(:grapes)
    end
  end

  context '#update' do
    it 'updates the item in the database with the parameters passed in' do
      database.update(item: :mango, discount: :half_price)
      expect(database.items.last[:discount]).to eq(:half_price)
    end
  end

  context '#delete' do
    it 'deletes the entry that matches the item parameter' do
      database.delete(:pineapple)
      expect(database.items).to_not include(
        {
          item: :pineapple,
          price: 100,
          discount: :first_half_price
        }
      )
    end
  end
end
