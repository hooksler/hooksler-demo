class DummyOutbound
  extend Hooksler::Channel::Output
  register :dummy

  def initialize(params)
    @params = params
  end

  def dump(message)
    ap "-- #{message.title} : #{message.level} --"
    ap message.user
    ap message.message
    ap message.url
  end
end
