class Database
  attr_reader :items

  def initialize
    @items = [
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
  end

  def create(item:, price:, discount:)
    items << {
      item: item,
      price: price,
      discount: discount
    }
  end

  def update(item:, column:, value:)
    items.each do |record|
      if record[:item] == item
        record[column] = value
      end
    end
  end

  def delete(item)
    items.each_with_index { |element, index| items.delete_at(index) if element[:item] == item }
  end
end
