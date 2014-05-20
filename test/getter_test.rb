require_relative 'test_helper'
require_relative 'mock_class'
require 'virtus/delegate'

describe Virtus::Delegate do
  let(:object) { MockClass.new(id: 123, name: "Hello World", nickname: 'it works') }
  subject { DelegatedClass.new(object) }

  it "gets the accessors correctly" do
    assert_equal 123, subject.id
    assert_equal "Hello World", subject.name
  end

  it "report the delegate class as the class" do
    assert_equal DelegatedClass, subject.class
  end

  it "only delegates to the methods on the attribute set" do
    assert_raises NoMethodError do
      subject.other_method
    end
  end

  it "allows you to use super correctly" do
    assert_equal 'it works, omg', subject.nickname
  end
end
