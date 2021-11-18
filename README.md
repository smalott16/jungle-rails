# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. I did not build this app from scratch. I added features and fixed bugs of this existing web app in order to learn Rails. 

## Features added
- "Sold Out" badge for products out of stock
- Adminitrator page for adding new product categories
- Added user authentication
- Added order details to summarize purchase after payment


## Bugs Fixed
- Money formatting (fixed decimal points and leading '$' signs)
- Fixed basic http authentication for administrators
- Fixed empyty cart checkout 

## RSpec testing
- Home page functionality
- Product details page functionality
- Add-to-cart functionality 

## Screenshots
<p align="center">
  <img alt="Desktop view on page load" width="600" src="https://github.com/smalott16/jungle-rails/blob/master/docs/Screen%20Shot%202021-11-17%20at%204.45.34%20PM.png?raw=true"></img>
  <p align="center">Home page displaying all products. </p>
  <br>
</p>

<p align="center">
  <img alt="sold out badge" width="250" src="https://github.com/smalott16/jungle-rails/blob/master/docs/Screen%20Shot%202021-11-17%20at%204.56.42%20PM.png?raw=true"></img>
  <p align="center">Product displaying the "sold out" badge </p>
  <br>
</p>

<p align="center">
  <img alt="Admin products view" width="600" src="https://github.com/smalott16/jungle-rails/blob/master/docs/Screen%20Shot%202021-11-17%20at%204.55.07%20PM.png?raw=true"></img>
  <p align="center">Administrators product page. From here, admins can add and remove products from the store. </p>
  <br>
</p>

<p align="center">
  <img alt="Cart view" width="600" src="https://github.com/smalott16/jungle-rails/blob/master/docs/Screen%20Shot%202021-11-17%20at%204.55.50%20PM.png?raw=true"></img>
  <p align="center">Cart Page</p>
  <br>
</p>

## Setup
### Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

### Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

### Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
