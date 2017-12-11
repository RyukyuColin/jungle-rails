# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example. Styled using Sass and Bootstrap.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt
* Puma

## ScreenShots

Home Page
!["Screenshot Home Page"](https://github.com/RyukyuColin/jungle-rails/blob/master/docs/Screen%20Shot%202017-12-10%20at%2017.53.07.png)

Product Page
!["Screenshot Product Page"](https://github.com/RyukyuColin/jungle-rails/blob/master/docs/Screen%20Shot%202017-12-10%20at%2017.53.47.png)

Shopping Cart Page
!["Screenshot Shopping Cart"](https://github.com/RyukyuColin/jungle-rails/blob/master/docs/Screen%20Shot%202017-12-10%20at%2017.54.37.png)

Successful Order
!["Screenshot Successful Order"](https://github.com/RyukyuColin/jungle-rails/blob/master/docs/Screen%20Shot%202017-12-10%20at%2017.55.37.png)