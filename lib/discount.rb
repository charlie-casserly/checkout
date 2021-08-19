class Discount
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def apply_discount(database_item, count)
    case database_item[:discount]
      when :half_price then half_price(database_item, count)
      when :first_half_price then first_half_price(database_item, count)
      when :two_for_one then two_for_one(database_item, count)
      when :buy_three_get_one_free then buy_three_get_one_free(database_item, count)
    end
  end

  def update_discount(item, discount)
    items.prices.each { |k, v| k[:discount] = discount if k[:item] == item }
  end

  private

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

