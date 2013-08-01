require 'test_helper'
require 'block_configurable'

class Configurable
  include BlockConfigurable

  configurable :value_with_default, 1
  configurable :value_without_default, nil
  configurable :value_to_change, 'a'
  configurable :value_to_test_hash, :test
end

module ConfigurableModule
  include BlockConfigurable

  configurable :value_with_default, 1
end

class BlockConfigurableTest < Minitest::Test
  attr_reader :configuration

  def setup
    @configuration = Configurable.configuration
  end

  def test_default_values
    assert_equal 1, configuration.value_with_default
    assert_nil configuration.value_without_default
  end

  def test_can_be_configured_with_block
    assert_equal 'a', configuration.value_to_change

    Configurable.configure do |c|
      c.value_to_change = 'b'
    end

    assert_equal 'b', configuration.value_to_change
  end

  def test_can_be_converted_to_hash
    assert_equal 4, configuration.to_hash.size
    assert_equal :test, configuration.to_h[:value_to_test_hash]
  end

  def test_can_be_included_in_a_module_too
    assert_equal 1, ConfigurableModule.configuration.value_with_default
  end
end
