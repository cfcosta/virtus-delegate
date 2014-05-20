module Virtus
  def self.delegate(klass)
    Virtus::Delegate.for(klass)
  end

  module Delegate
    extend self

    def for(klass)
      Module.new do
        attr_accessor :_target

        def initialize(target)
          @_target = target
        end

        klass.attribute_set.each do |attribute|
          define_method(attribute.name) { _target.send(attribute.name) }
        end
      end
    end
  end
end
