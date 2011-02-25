# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "errbit_zmq_handler/version"

Gem::Specification.new do |s|
  s.name        = "errbit_zmq_handler"
  s.version     = ErrbitZmqHandler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Recobra"]
  s.email       = ["oruenu@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "errbit_zmq_handler"

  s.add_dependency "ffi", ">= 0"
  s.add_dependency "dripdrop", ">= 0.9.10"
  s.add_dependency "yajl-ruby", ">= 0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
