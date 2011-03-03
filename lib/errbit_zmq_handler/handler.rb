# encoding: utf-8
module ErrbitZmqHandler
  class Handler < DripDrop::Node
    attr_accessor :uri
    def action
      route :exceptions, :zmq_subscribe, uri, :bind, :msg_format => :raw

      exceptions.on_recv do |messages|
        xml = messages.first.copy_out_string
        puts "[#{Time.now}] got notice"
        start = Time.now
        Notice.from_xml(xml)
        puts "Notice saved in #{Time.now - start} seconds\n\n"
      end
    end
  end
end
