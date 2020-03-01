# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * 2.7.0

* System dependencies
  * rails 6.0.2
  * mysql 5.7

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Installation
  ```
  $ docker-compose up -d
  $ docker-compose run web bundle exec rails db:create db:migrate

  # localhost:3000にアクセス
  ```

* Usages
  * login for mysql
    ```
    $ mysql -u root -p -h localhost -P 3306 --protocol=tcp
    ```
  * execute command
    ```
    $ docker-compose run web ~~~

    # ex) bundle install
    $ docker-compose run web bundle install

    # ex) rails db:migrate
    $ docker-compose run web bundle exec rails db:migrate
    ```

