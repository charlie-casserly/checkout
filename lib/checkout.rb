require_relative 'discount'
require_relative 'items'

class Checkout
  attr_reader :prices, :basket, :items
  private :prices, :basket

  def initialize(items = Items.new)
    @items = items
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
        fetch_price(item) * (count / 2)
      else
        fetch_price(item) * count
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

  def fetch_price(item)
    items.prices.each { |k, v| return k[:price] if k[:item] == item }
  end
end
