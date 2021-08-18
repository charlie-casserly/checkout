class Items
  def initialize
    prices = [
      { 
        item: :pineapple,
        price: 100,
        discount: 'first_half_price'
      },
      {
        item: :apple,
        price: 10,
        discount: 'two_for_one'
      },
      {
        item: :orange,
        price: 20,
        discount: nil
      },
      {
        item: :pear,
        price: 15,
        discount: 'two_for_one'
      },
      {
        item: :banana,
        price: 30,
        discount: 'half_price'
      },
      {
        item: :mango,
        price: 200,
        discount: 'buy_three_get_one_free'
      }
    ]
  end
end