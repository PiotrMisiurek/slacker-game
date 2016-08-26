class Reports::DisplayMostActiveEntry < Reports::DisplayBaseEntry

  ACTION_NAMES = [
      "napisał",
      "spłodził",
      "dojebał",
      "stworzył",
      "wymodził"
  ].freeze

  private

  def action
    ACTION_NAMES.sample
  end

  def one_thing
    "wpis"
  end

  def few_things
    "wpisy"
  end

  def many_things
    "wpisów"
  end
end
