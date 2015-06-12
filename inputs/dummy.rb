class DummyInbound
  extend Hooksler::Channel::Input
  register :dummy

  def initialize(params)
    @params = params
  end

  def load(request)
    build_message({}) do |msg|
      msg.message = request.body.read
    end
  end
end
