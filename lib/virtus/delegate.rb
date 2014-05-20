module Virtus
  def self.delegate(klass)
    Virtus::Delegate.for(klass)
  end

  module Delegate
    extend self

    def for(klass)
      Module.new do
        attr_reader :_target, :_old_targets

        def initialize(target)
          @_target = target
          @_old_targets = []
        end

        klass.attribute_set.each do |attribute|
          define_method(attribute.name) { _target.send(attribute.name) }
          define_method(:"#{attribute.name}=") do |value|
            @_old_targets << _target
            @_target = _target.with(attribute.name => value)
            value
          end
        end
      end
    end
  end
end
