class Slack::ReadAccount

  def self.call(api)
    new(api).call
  end

  def initialize(api)
    @api = api
    @reports = {
      most_active: {}
    }
  end

  def call
    api.channels_list["channels"].each do |channel|
      Slack::ReadChannel.call(channel["id"], api, reports)
    end
    reports
  end

  private

  attr_reader :api, :reports
end
