require_relative 'test_helper'
require_relative 'mock_class'
require 'virtus/delegate'

describe Virtus::Delegate do
  let(:object) { MockClass.new(id: 123, name: "Hello World", nickname: 'it works') }
  subject { DelegatedClass.new(object) }

  it "gets the writers correctly" do
    subject.id = 456
    subject.name = "Bye World"

    assert_equal 456, subject.id
    assert_equal "Bye World", subject.name
  end

  it "builds a new object" do
    old_target = subject._target
    subject.id = 456

    assert_equal 123, old_target.id
    assert_equal 456, subject.id
  end

  it "ACTUALLY creates a new object" do
    old_target = subject._target
    subject.id = 456

    refute_equal old_target.object_id, subject._target.id
  end

  it "keeps older targets in history" do
    old_target = subject._target
    subject.id = 456

    assert_equal [old_target], subject._old_targets
  end

  it "keeps more than one target in history" do
    older_target = subject._target
    subject.id = 1
    old_target = subject._target
    subject.id = 2

    assert_equal [older_target, old_target], subject._old_targets
  end

  it "allows you to use super correctly" do
    subject.nickname = 'Ninja Master'
    assert_equal 'ninjamaster, omg', subject.nickname
  end
end
