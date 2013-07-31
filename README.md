# BlockConfigurable

[![Build Status](https://travis-ci.org/artemshitov/block_configurable.png?branch=master)](https://travis-ci.org/artemshitov/block_configurable) [![Code Climate](https://codeclimate.com/github/artemshitov/block_configurable.png)](https://codeclimate.com/github/artemshitov/block_configurable)

A little mixin to make your classes and modules configurable using either single statements or blocks.

## Installation

Install as a standalone gem:

    gem install block_configurable

Or include into your `Gemfile`:

    gem 'block_configurable', '~> 0.9.0'

## Usage
    
```ruby
class MyClass
  include BlockConfigurable

  config :param_with_default_value, 'A default!'
  config :param_without_default_value
  config :another_one
end

MyClass.configuration.param_with_default_value
#=> 'A default!'

MyClass.configuration.param_without_default_value
#=> nil

MyClass.configure do |c|
  c.param_with_default_value = 'My values, my rules'
  c.param_without_default_value = 'A value now!'
end

MyClass.configuration.param_with_default_value
#=> 'My values, my rules'

MyClass.configuration.param_without_default_value
#=> 'A value now!'

MyClass.configuration.another_one = 'The third'

MyClass.configuration.another_one
#=> 'The third'
```
