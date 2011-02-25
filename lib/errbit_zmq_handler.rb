# encoding: utf-8
require 'yajl'
require 'dripdrop'
module ErrbitZmqHandler
end

Thread.abort_on_exception = true

DripDrop::Node.new do
  route :exceptions, :zmq_subscribe, "tcp://127.0.0.1:9998", :bind, :msg_format => :raw

  exceptions.on_recv :raw do |messages|
    puts "Receiver 1: #{messages.first.copy_out_string}"
  end
end.start!
