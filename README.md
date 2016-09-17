### Steps to start the warehouse dicount service.
1. `cd warehouse_discount`
2. `gem install bundler`
3. `gem install rack`
4. `bundle install`
5. `bundle exec rackup -p 9292`

Now the service should be running in port 9292

### How to retrieve the recent purchases:

In your terminal, open another tab and execute the following:

`curl http://localhost:9292/api/recent_purchases/Morgan_Barton`

The command above will return all the recent purchases by `Morgan_Barton` and for each product, it will return a list of other people that also bought it.

The first call will take a few seconds to return, then it should be cached and the following calls to the same API endpoints should return faster.

When a call is make passing an user that don't exist, it will return:
Since `the_x_user` don't exist, calling:

`curl http://localhost:9292/api/recent_purchases/the_x_user`

will return:

`User with username of 'the_x_user' was not found`
