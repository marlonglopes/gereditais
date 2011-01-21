require 'test_helper'

class ModalidadeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Modalidade.new.valid?
  end
end
