class Reports::DisplayEntry

  def self.call(entry, report_name)
    new(entry, report_name).call
  end

  def initialize(entry, report_name)
    @entry = entry
    @report_name = report_name
  end

  def call
    "Reports::Display#{report_name.to_s.camelize}Entry".constantize.call(entry)
  end

  private

  attr_reader :entry, :report_name
end
