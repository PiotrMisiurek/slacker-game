class Reports::DisplayMostReactedEntry < Reports::DisplayBaseEntry

  ACTION_NAMES = ["dostał", "został odznaczny", "zdobył"].freeze

  private

  def action
    ACTION_NAMES.sample
  end

  def one_thing
    "emotke"
  end

  def few_thing
    "emotki"
  end

  def many_things
    "emotek"
  end

end
