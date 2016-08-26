class Reports::Display

  def self.call(reports)
    new(reports).call
  end

  def initialize(reports)
    @reports = reports
  end

  def call
    reports.each_pair { |name, report| display_report(name, report) }
  end

  private

  def display_report(name, report)
    puts "---------------------------------------------"
    puts name.to_s.upcase
    puts "---------------------------------------------"
    report.each do |entry|
      Reports::DisplayEntry.call(entry, name)
    end
    puts ""
  end

  attr_reader :reports
end
