require_relative 'discount'
require_relative 'items'

class Checkout
  attr_reader :prices, :basket, :items, :discount
  private :prices, :basket

  def initialize(items = Items.new, discount = Discount.new(items))
    @items = items
    @discount = discount
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
    database_item = fetch_item(item)
    database_item[:discount].nil? ? database_item[:price] * count : discount.apply_discount(database_item, count)
  end

  def fetch_item(item)
    items.prices.each { |k, v| return k if k[:item] == item }
  end
end
