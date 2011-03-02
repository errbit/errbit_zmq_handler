# encoding: utf-8
module ErrbitZmqHandler
  class Handler < DripDrop::Node
    attr_accessor :uri
    def action
      route :exceptions, :zmq_subscribe, uri, :bind, :msg_format => :raw

      exceptions.on_recv do |messages|
        xml = messages.first.copy_out_string
        Rails.logger.info "Recieved: #{xml}"
        Notice.from_xml(xml)        
      end
    end
  end
end
