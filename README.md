# README

DEMO: https://short-url-gapfish.herokuapp.com/

* Versions
  - ruby 2.7.3
  - Rails 6.1.4.1
  - "@rails/webpacker": "5.4.3"
  - "react": "^17.0.2",
  - "tailwindcss": "npm:@tailwindcss/postcss7-compat@^2.2.16",

* Database
  - postgres@10

* Database initialization
  - to create database
  ```
  rails db:create
  ```

  - to migrate database
  ```
  rails db:migrate
  ```

* Run the server
  ```
  rails s
  ```
 
** Overview **
  - a url shortener (something like bitly.com)
  
** Project Requirements **
  - as a user, I want to access your site, enter a url and get a reasonably short
  url back
  - when I access the shortened link, I want to be redirected to the actual
  source site, without really noticing that I was on a different page in between
  - further, we would like you to provide a register / login functionality
  - Users can create a link without being logged in
  - If users are logged in, all created links are saved to their profile
  - Saved links in profile show some basic stats (e.g. how often the link
  was accessed)
  
  ** Model **
  - User - for authentication
    has_many short_links
  - ShortLink - to store urls and its short identifier
    belongs_to user
    
  ** Packages/Gems **
  - devise - for user authentication
  - pry - for debugging
  - rspec-rails & factory_girl_rails - for tests
  - tailwind css - for building beautiful and responsive UI in short amount of time
 
  ** Pages **
  - Sign In - for login
  ```
  /users/sign_in
  ```

  - Sign up  - to register
  ```
  /users/sign_up
  ```

  - homepage - basically all the shortening UI and logic lies in homepage and can be access publicly or by logged in user
     if user is signed in, then the urls used are stored under user's profile
  ```
  /
  ```
     
  - Short Link Lists - List of the urls that user has shorten(only shows if user is logged in and the user created shortlinks while signed in)
  ```
  /short_links
  ```
 
  - any routes containing the short link identifier will get redirect to the url stored 
  - if the route does not matches the short link identifier, then it will be redirected to homepage.
