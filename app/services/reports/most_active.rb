class Reports::MostActive < Reports::Base

  def call
    if report.has_key?(author_uid)
      report[author_uid] += 1
    else
      report[author_uid] = 1
    end
  end

  private

  def report
    reports[:most_active]
  end
end
