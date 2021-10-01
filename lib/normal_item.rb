class NormalItem
	attr_accessor :days_remaining, :quality

	def initialize(days_remaining:, quality:)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    calculate_quality
    calculate_days_remaining
    calculate_quality_zero_days if @days_remaining < 0
  end
end