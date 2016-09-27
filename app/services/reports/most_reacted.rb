class Reports::MostReacted < Reports::Base

  def call
    if report.has_key?(author_uid)
      report[author_uid] += reactions_count
    else
      report[author_uid] = reactions_count
    end
  end

  private

  def report
    reports[:most_reacted]
  end

  def reactions_count
    message["reactions"].present? ? message["reactions"].size : 0
  end
end
