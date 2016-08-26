class Reports::Process

  def self.call(reports, api)
    new(reports, api).call
  end

  def initialize(reports, api)
    @reports = reports
    @api = api
  end

  def call
    reports.each_key do |key|
      reports[key] = reports[key].sort_by{ |uid, value| value }.reverse.first(5)
      reports[key].each do |entry|
        entry[0] = Slack::ReadUser.call(entry[0], api)["name"]
      end
    end
  end

  private

  attr_reader :reports, :api
end
