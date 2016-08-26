class Reports::DisplayBaseEntry

  def self.call(entry)
    new(entry).call
  end

  def initialize(entry)
    @entry = entry
  end

  def call
    puts "#{name} #{action} #{value} #{thing}"
  end

  private

  attr_accessor :entry

  def value
    @_value ||= entry[1]
  end

  def name
    @_name ||= entry[0]
  end

  def thing
    if value == 1
      one_thing
    elsif [2,3,4].include?(value)
      few_things
    else
      many_things
    end
  end
end
