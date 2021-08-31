require_relative 'discount'
require_relative 'database'

class Checkout
  attr_reader :basket, :database

  def initialize(database = Database.new)
    @database = database
    @basket = []
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    item_amounts = basket.each_with_object(Hash.new(0)) { |item, items| items[item] += 1; }
    total_cost_calculator(item_amounts)
  end

  private

  def total_cost_calculator(item_amounts)
    costs_array = item_amounts.map { |item, count| item_cost_calculator(item, count) }
    costs_array.inject(:+)
  end

  def item_cost_calculator(item, count)
    database_item = fetch_item(item)
    database_item[:discount].nil? ? database_item[:price] * count : Discount.apply_discount(database_item, count)
  end

  def fetch_item(item)
    database.items.each { |k, _v| return k if k[:item] == item }
  end
end
