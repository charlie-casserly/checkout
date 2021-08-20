class Items
  attr_reader :prices

  def initialize
    @prices = [
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
    prices << {
      item: item,
      price: price, 
      discount: discount
    }
  end

  def update(item:, price: 'default', discount: 'default')
    prices.each do |element| 
      if element[:item] == item
        element[:price] = price unless price == 'default'
        element[:discount] = discount unless discount == 'default'
      end
    end
  end

  def delete(item)
    prices.each_with_index do |element, index|
      prices.delete_at(index) if element[:item] == item
    end
  end
end