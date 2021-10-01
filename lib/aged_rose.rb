require 'normal_item'

class AgedRose < NormalItem

	# def initialize(days_remaining:, quality:)
 #    @days_remaining = days_remaining
 #    @quality = quality
 #  end

  # def tick
  #   calculate_quality
  #   calculate_days_remaining
  #   calculate_quality_zero_days if @days_remaining < 0
  # end

	def calculate_quality
		if @quality < 50
			@quality = @quality + 1
		end
	end

	def calculate_quality_zero_days
		if @quality < 50
      @quality = @quality + 1
    end
	end

	def calculate_days_remaining
    @days_remaining = @days_remaining - 1
  end
end