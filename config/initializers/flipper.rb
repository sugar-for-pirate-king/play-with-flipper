require 'flipper'

Flipper.configure do |config|
  config.default do
    # use active records as the flipper adapter.
    adapter = Flipper::Adapters::ActiveRecord.new

    # pass adapter to handy DSL instance
    Flipper.new(adapter)
  end
end
