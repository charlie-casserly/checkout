class Discount
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_discount(item, discount)
    items.prices.each { |k, v| k[:discount] = discount if k[:item] == item }
  end

  def half_price(database_item, count)
    (database_item[:price] / 2) * count
  end

  def first_half_price(database_item, count)
    database_item[:price] * count - (database_item[:price] / 2)
  end

  def two_for_one(database_item, count)
    count.even? ? database_item[:price] * (count / 2) : database_item[:price] * count
  end

  def buy_three_get_one_free(database_item, count)
    database_item[:price] * (count - (count / 4))
  end
end

