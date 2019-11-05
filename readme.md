# 1. Setup
## Ruby & Bundler
To be able to do this challange make sure you have installed a recent version of ruby and bunlder.
https://www.ruby-lang.org/en/
https://bundler.io
## Clone the project
For this challenge, you re going to use this repo as a starter project, for that you need to clone it.
`git clone https://github.com/2wunder/currency-data-junior.git`
## Install dependencies 
To install required dependencies you just need to run `bundle install`
## Database server
We assumed that you will be using *PostgreSQL* as a database server, that is why we included by default PostgreSQL datamapper adapter.
In case you want to use another database server please check the [documentation of datamapper](https://datamapper.org/getting-started.html) and add the right adapter.

Make sure to update database connection path in the file `config/environment.rb`.

# 2. Run the project
To run this starter project, simply execute `rackup` in your console
# 3. Challenge!
## The Task
You need to create a simple web application that converts currency rates from EUR to USD and from EUR to CHF (both ways) from currencylayer API. the app will be mainly composed from 2 views:
1. A view with a form includes the **value to convert**, **From** and **to** currencies. Submitting the form will show the result of the conversion but also it will **save the value, from , to and the result in the database**.
2. A view includes a table with all the history of currency conversions.
## Constraints
-   Use  `money-currencylayer-bank`  gem ​
- [https://currencylayer.com](https://currencylayer.com/) you'll have to sign up for a free account to get the API key
## Hints
 - http://sinatrarb.com/intro.html
 - https://datamapper.org/getting-started.html
## Plus
Writing tests is always appreciated, that's why we included [*Rspec*](https://rspec.info) and [*RackTest*](https://github.com/rack-test/rack-test) in the project, all necessary configuration is already done. You can check the  [*Rspec*](https://rspec.info) and [*RackTest*](https://github.com/rack-test/rack-test) documentation.

To run tests simply execute `rspec`  
# 4. Finishing up
- We are expecting your work to be hosted on github repo 
- Send the challenge repo link in a email to **m.kheder@klarx.com** with subject **interns coding challenge**
- We are expecting to receive your code within a week from getting the challenge email.