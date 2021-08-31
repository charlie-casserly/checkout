# Cashier Checkout

Cashier Checkout is a program that allows the user to apply discounts to items from a database, add these items to a basket, and then return the basket total cost with discounts applied.

## Installation and launching steps 

1. `Clone this repo`
1. `cd into your local clone`
1. `In your terminal, run 'irb -r './lib/checkout.rb'`
1. `In IRB, type 'checkout = Checkout.new' to create a new Checkout object simply named *checkout*.`

## How to use the Cashier Checkout

Item list: 

        Item: Pineapple
        Price: 100
        Discount: First half price
     
        Item: Apple
        Price: 10,
        Discount: Two for one
     
        Item: Orange
        Price: 20
        Discount: None
     
        Item: Pear
        Price: 15
        Discount: Two for one
     
        Item: Banana
        Price: 30
        Discount: Half price
     
        Item: Mango
        Price: 200
        Discount: Buy three get one free

### Scanning an item
* `checkout.scan(item)`

   Examples:

   `checkout.scan(:apple)` - adds an apple to the basket

   `checkout.scan(:mango)` - adds a mango to the basket

### Updating a discount
*  `checkout.database.update(item:, column:, value:)`

   Example:

   `checkout.database.update(item: :orange, column: :discount, value: :half_price)` - updates the record for oranges to give oranges a discount of half price.

### Getting the total cost of a basket
* `checkout.total`

   Example:

   `checkout.total` - returns the total cost of a basket with all discounts for items included.

## Additional development notes

I wrote this program in Ruby and used a TDD development process to implement it's features. The program began as a legacy code refactoring test with two additional new requirements. One being a buy three get one free discount on mangoes, and the other was a new feature to dynamically declare discounts for items. I began by removing unnecessary clutter and seperating some concerns in the checkout #total method, and once the code was slightly more readable I moved on to writing tests for the new features and adding some edge case tests for old features so that I could refactor without introducing bugs. I settled on a solution that made use of three classes. Checkout, Discount, and Database. All outside dependencies were doubled and mocked in my testing and I achieved 100% test coverage.

## Notes from candidate

Hello Engineers at StudentBeans!

Here is my tech test submission for the Backend Engineer role. I have really enjoyed this test and I hope that my solution is worthy of your approval!
I made the decision to add some methods into the Database class just to make it a better representation of an actual database. I have also tried to keep my commit messages as detailed as possible and have committed regularly. I hope this is all okay!

Have a wonderful weekend! 
Charlie Casserly
