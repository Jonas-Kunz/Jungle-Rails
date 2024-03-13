# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

# Notes

I Had a Lot of fun with this project, It was great experiencing being given a work in progress and adding new fetures!

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. To test Email reciepts Create a MailTrap Account for free and copy and paste the Ruby on Rails SMTP Settings into config/environments/development.rb

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## ScreenShots


![Front Page](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/frontPage.png)

![Logged in front page](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/frontPageLoggedIn.png)

![Admin Dashboard](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/adminDashboard.png)

![Admin Categories](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/adminCategories.png)

![Admin New Category](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/adminNewCategory.png)

![Admin Products](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/adminProducts.png)

![Admin New Product](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/adminNewProduct.png)

![Login Page](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/loginPage.png)

![Login Page with errors](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/loginErrors.png)

![Sign Up Page](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/signUp.png)

![Sign Up Page with errors](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/signUpErrors.png)

![Order Confirmation Email](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/orderEmail.png)

![Cart](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/cart.png)

![Order Confirmation](https://github.com/Jonas-Kunz/Jungle-Rails/blob/main/docs/orderConfirmation.png)
