# BlockConfigurable

[![Build Status](https://travis-ci.org/artemshitov/block_configurable.png?branch=master)](https://travis-ci.org/artemshitov/block_configurable) [![Code Climate](https://codeclimate.com/github/artemshitov/block_configurable.png)](https://codeclimate.com/github/artemshitov/block_configurable) [![Gem Version](https://badge.fury.io/rb/block_configurable.png)](http://badge.fury.io/rb/block_configurable)

A little mixin to make your classes and modules configurable using either single statements or blocks.

## Installation

Install as a standalone gem:

    gem install block_configurable

Or include into your `Gemfile`:

```ruby
gem 'block_configurable', '~> 0.10.0'
```

## Usage

Set up class (or module). Only parameters explicitly listed will be available for configuration.

```ruby
class MyClass
  include BlockConfigurable

  configurable :param_with_default_value, 'A default!'
  configurable :param_without_default_value
  configurable :another_one
end
```

Configure it:

```ruby
MyClass.configure do |c|
  c.param_without_default_value = 'A value now!'
  c.another_one = 'My values, my rules'
end

# or

MyClass.configuration.another_one = 'My values, my rules'
```

Read configuration:

```ruby
MyClass.configuration.param_with_default_value
#=> 'A default!'

MyClass.configuration.another_one
#=> 'My values, my rules'
```
