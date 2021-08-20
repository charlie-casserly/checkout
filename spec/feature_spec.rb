require 'checkout'

RSpec.describe 'Feature' do 
  let(:checkout) { Checkout.new }

  context '#total' do 
    it 'adds up the total cost of a basket where 5 of every fruit has gone through #scan' do 
      5.times do 
        checkout.scan('pineapple') 
        checkout.scan('apple')
        checkout.scan('orange')
        checkout.scan('pear')
        checkout.scan('banana')
        checkout.scan('mango')
      end

      expect(checkout.total).to eq(1500)
    end
  end
end