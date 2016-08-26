class Slack::ReadChannel

  def self.call(channel_id, api, reports)
    new(channel_id, api, reports).call
  end

  def initialize(channel_id, api, reports)
    @api = api
    @channel_id = channel_id
    @reports = reports
  end

  def call
    messages_batch
  end

  private

  attr_reader :api, :channel_id, :reports

  def messages_batch(lastest = nil, oldest = 2.hours.ago.to_i, count = 1000)
    puts "jadę"
    response = api.channels_history(channel: channel_id, lastest: lastest, oldest: oldest)
    response["messages"].each do |message|
      Slack::ReadMessage.call(message, reports)
    end
    if response["has_more"]
      messages_batch(response["messages"].last["ts"], oldest, count)
    end
  end
end
