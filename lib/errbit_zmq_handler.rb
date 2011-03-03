# encoding: utf-8

Thread.abort_on_exception = true

module ErrbitZmqHandler
  autoload :Configuration, 'errbit_zmq_handler/configuration'
  autoload :Handler, 'errbit_zmq_handler/handler'
  autoload :VERSION, 'errbit_zmq_handler/version'
  class << self
    # A Errbit ZMQ Handler configuration object. Must act like a hash and return sensible
    # values for all Hoptoad ZMQ configuration options. See ErrbitZmqHandler::Configuration.
    attr_accessor :configuration

    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   ErrbitZmqHandler.configure do |config|
    #     config.mailbox_size = 1000
    #     config.uri  = 'tcp://errbit.home:9999'
    #   end
    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    # The handler object is responsible for delivering formatted data to the Hoptoad server.
    # Must respond to #start!. See ErrbitZmqHandler::Handler.
    def handler
      @handler ||= Handler.new.tap {|h| h.uri = ErrbitZmqHandler.configuration.uri}
    end
  end
end

