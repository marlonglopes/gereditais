require 'test_helper'

class EditalTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Edital.new.valid?
  end
end
