require 'spec_helper'
require 'checkout'

RSpec.describe Checkout do
  describe '#total' do
    subject(:total) { checkout.total }

    let(:checkout) { described_class.new(items) }
    let(:items) { double(:items, prices: [
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
      )
    }

    context 'when no offers apply' do
      before do
        checkout.scan(:apple)
        checkout.scan(:orange)
      end

      it 'returns the base price for the basket' do
        expect(checkout.total).to eq(30)
      end
    end

    context 'when a two for 1 applies on apples' do
      before { 2.times { checkout.scan(:apple) } }

      it 'returns the discounted price for the basket' do
        expect(checkout.total).to eq(10)
      end

      context 'and there are other items' do
        before { checkout.scan(:orange) }

        it 'returns the correctly discounted price for the basket' do
          expect(checkout.total).to eq(30)
        end
      end
    end

    context 'when a two for 1 applies on pears' do
      before { 2.times { checkout.scan(:pear) } }

      it 'returns the discounted price for the basket' do
        expect(checkout.total).to eq(15)
      end

      context 'and there are other discounted items' do
        before { checkout.scan(:banana) }

        it 'returns the correctly discounted price for the basket' do
          expect(checkout.total).to eq(30)
        end
      end
    end

    context 'when a half price offer applies on bananas' do
      before { checkout.scan(:banana) }

      it 'returns the discounted price for the basket' do
        expect(checkout.total).to eq(15)
      end
    end

    context 'when a half price offer applies on pineapples restricted to 1 per customer' do

      it 'returns the discounted price for two pineapples' do
        2.times { checkout.scan(:pineapple) }
        expect(checkout.total).to eq(150)
      end

      it 'returns the discounted price for four pineapples' do
        4.times { checkout.scan(:pineapple) }
        expect(checkout.total).to eq(350)
      end
    end

    context 'when a buy 3 get 1 free offer applies to mangos' do
      it 'returns the discounted price for four mangos' do
        4.times { checkout.scan(:mango) }
        expect(checkout.total).to eq(600)
      end

      it 'returns the discounted price for twelve mangos' do
        12.times { checkout.scan(:mango) }
        expect(checkout.total).to eq(1800)
      end

      it 'doesnt return a discount unless there is at least 4 mangos' do 
        3.times { checkout.scan(:mango) }
        expect(checkout.total).to eq(600)
      end
    end
  end
end
