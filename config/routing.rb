require 'hooksler/slack'
require 'hooksler/newrelic'
require 'hooksler/trello'
require 'dotenv'

Dotenv.load

Hooksler::Router.config do
  secret_code 'very_secret_code'
  host_name 'http://example.com'

  endpoints do
    input  'simple',        type: :simple
    input  'newrelic',      type: :newrelic
    input  'trello',        type: :trello,
           create: false,
           public_key: ENV['TRELLO_KEY'],
           member_token: ENV['TRELLO_TOKEN'],
           board_id: ENV['TRELLO_ID1']

    output 'black_hole', type: :dummy
    output 'slack_out', type: :slack, url: ENV['SLACK_WEBHOOK_URL'], channel: '#test'
  end

  route 'simple'       => 'slack_out'
  route 'trello'       => ['black_hole', 'slack_out']
  route 'newrelic'     => ['black_hole', 'slack_out']
end
