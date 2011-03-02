# encoding: utf-8
require 'spec_helper'

describe ErrbitZmqHandler::Configuration do
  it "should have an uri" do
    assert_config_overridable :uri
  end

  it "should set handler uri" do
    @uri = "tcp://localhost"
    ErrbitZmqHandler.configure do |config|
      config.uri = @uri
    end

    ErrbitZmqHandler.handler.uri.should == @uri 
  end
end

def assert_config_overridable(option, value = 'a value')
  config = ErrbitZmqHandler::Configuration.new
  config.send(:"#{option}=", value)
  config.send(option).should == value
end

def assert_config_default(option, default_value, config = nil)
  config ||= ErrbitZmqHandler::Configuration.new
  config.send(option).should == default_value
end
