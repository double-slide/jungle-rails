# Jungle

A [Ruby-on-rails](https://rubyonrails.org/) based mini e-commerce application for selling plants.

## Dependencies

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Product Views
!["Home page"](https://github.com/double-slide/jungle-rails/blob/master/public/images/jungle_home_page.png?raw=true)
!["Cart page"](https://github.com/double-slide/jungle-rails/blob/master/public/images/jungle_cart_page.png?raw=true)


## Project Goals
- Familiarization with Ruby and the Rails framework
- Familiarize with Cypress testing framework
- Inherite and navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory

## Implemented Features & Fixes
- Sold Out Badge
  - When a product has 0 quantity, a sold out badge should be displayed on the product list page
- Admin Categories
  - Admin users can list and create new categories, and add new products under category
- User Authentication
  - Visitors can go to the registration page from any page in order to create an account
  - Visitors can sign up for a user account with name, e-mail, and password
  - Visitors can sign in using e-mail and password
  - Users (signed in) can log out from any page
  - Visitors cannot sign up with an existing e-mail address (uniqueness validation)
  - Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User model, leveraging the bcrypt gem
- Order Details Page
  - The order page contains items, their image, name, description, quantities and line item totals
  - The final amount for the order is displayed
  - The email that was used to place the order is displayed
- Add Missing Admin Security
  - User must enter HTTP auth login/password to access admin functionality
  
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use card # 4111 1111 1111 1111 for testing successful order scenarios. Any future date can be used for card expiry, and any 3 digits for the CVV.

More information in Stripe docs: <https://stripe.com/docs/testing#cards>
