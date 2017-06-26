### Setup

###### Initial Steps

* Clone repository
* `cd` to the project's root directory
* Run `gem install bundler`
* Run `bundle install` to install all of the required gems


###### Setup your environment variables
In your root directory, create a `.env` file and add the following:

```
USERNAME = YOUR USERNAME
API_KEY = YOUR API KEY
```

###### Tests and Execution
* Run `rspec` to make sure that all tests are passing
* Run `rackup`
* Visit [localhost:9292](localhost:9292) in a browser
* Start sending coins


### User Stories

```
As a User
So that I can use Coolpay
I want to able to authenticate myself
```

```
As a User
So that I can pay my friend
I want to able to add him as a recipient
```

```
As a User
So that I can pay my friend
I want to able to transfer money
```

```
As a User
So that I know whether I paid my friend
I want to able to see the status of my payment
```
