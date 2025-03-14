# -*- encoding : utf-8 -*-
require 'rubygems'
require 'openpayu'
require 'test_objects/order'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir                    = 'spec/cassettes'
  c.hook_into                               :webmock
  c.allow_http_connections_when_no_cassette = true
  # c.debug_logger = File.open(ARGV.first, 'w')
end

RSpec.configure do |config|
  config.filter_run_excluding broken: true
  config.before(:all) do
    OpenPayU::Configuration.configure do |cfg|
      cfg.env              = 'secure'
      cfg.merchant_pos_id  = '114207'
      cfg.signature_key    = '1f9fd7298097b9414db5d1bfd1204d20'
      cfg.algorithm        = 'MD5'
      cfg.service_domain   = 'payu.com'
      cfg.protocol         = 'https'
      cfg.data_format      = 'json'
    end
  end
end
