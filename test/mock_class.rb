require 'virtus'
require 'virtus/delegate'

class MockClass
  include Virtus.value_object

  values do
    attribute :id, Integer
    attribute :name, String
    attribute :nickname, String
  end

  def other_method
    true
  end
end

class DelegatedClass
  include Virtus.delegate(MockClass)

  def nickname
    super + ', omg'
  end
end
