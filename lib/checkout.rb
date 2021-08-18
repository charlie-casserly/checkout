require_relative 'discount'

class Checkout
  attr_reader :prices, :basket
  private :prices, :basket

  def initialize(prices)
    @prices = prices
    @basket = []
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    item_amounts = basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }

    total_calculator(item_amounts)
  end

  private

  def total_calculator(item_amounts)
    costs_array = item_amounts.map { |item, count| cost_counter(item, count) }
    costs_array.inject(:+)
  end

  def cost_counter(item, count)
    if item == :apple || item == :pear
      if (count % 2 == 0)
        prices.fetch(item) * (count / 2)
      else
        prices.fetch(item) * count
      end
    elsif item == :banana || item == :pineapple
      if item == :pineapple
        prices.fetch(item) * count - (prices.fetch(item) / 2)
      else
        (prices.fetch(item) / 2) * count
      end
    elsif item == :mango
      prices.fetch(item) * (count - (count / 4))
    else
      prices.fetch(item) * count
    end
  end
end
