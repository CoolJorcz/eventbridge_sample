# Bookstore and Transaction Service

Sample EventBridge connection.

For my details, see article on [Medium](https://medium.com)

* Ruby version
  2.7

* System dependencies
  Postgres

* Configuration
  In order to use, make sure the following environment variables are set.
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  Or whatever IAM policy you use to connect to your AWS account.

* Database creation
  ```rake db:setup``` 
  or 
  ```rake db:create db:migrate```

* Database initialization
```
rake db:create
```

* How to run the test suite
	
  ```
  be rails spec
  ```
  
* Services (job queues, cache servers, search engines, etc.)

  Uses ActiveJob via DelayedJob. To run background jobs, run `rake jobs:work`
  Connects to EventBridge

* Deployment instructions
  Procfile exists for Heroku deployment

