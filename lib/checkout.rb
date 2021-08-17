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

    price_calculator(item_amounts)
  end

  private

  def price_calculator(item_amounts)
    total = 0
    item_amounts.each do |item, count|
      if item == :apple || item == :pear
        if (count % 2 == 0)
          total += prices.fetch(item) * (count / 2)
        else
          total += prices.fetch(item) * count
        end
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          total += (prices.fetch(item) / 2)
          total += (prices.fetch(item)) * (count - 1)
        else
          total += (prices.fetch(item) / 2) * count
        end
      elsif item == :mango
        total += prices.fetch(item) * (count - (count / 4))
      else
        total += prices.fetch(item) * count
      end
    end
    total
  end

end
