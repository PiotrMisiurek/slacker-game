class Reports::Base

  def self.call(message, reports)
    new(message, reports).call
  end

  def initialize(message, reports)
    @message = message
    @reports = reports
  end

  def call
    fail NotImplementedError
  end

  private

  def author_uid
    message["user"]
  end

  attr_reader :message, :reports

end
