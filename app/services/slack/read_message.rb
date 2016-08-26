class Slack::ReadMessage

  def self.call(message, reports)
    new(message, reports).call
  end

  def initialize(message, reports)
    @message = message
    @reports = reports
  end

  def call
    puts "#{message["user"]}"
    Reports::MostActive.call(message, reports)
  end

  private

  attr_accessor :message, :reports
end
