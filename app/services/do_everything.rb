require "slack"

class DoEverything

  def self.call(token)
    new(token).call
  end

  def initialize(token)
    @api = Slack::Client.new token: token
  end

  def call
    @reports = Slack::ReadAccount.call(api)
    Reports::Process.call(reports, api)
    Reports::Display.call(reports)
  end

  private

  attr_reader :api, :reports
end
