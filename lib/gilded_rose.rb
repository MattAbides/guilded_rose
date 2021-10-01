require 'aged_rose'

class GildedRose
  attr_reader :name, :days_remaining, :quality, :item

  def initialize(name:, days_remaining:, quality:)
    # @name = name
    # @days_remaining = days_remaining
    # @quality = quality
    @item = case name
      when 'Aged Brie'
        AgedRose.new(days_remaining: days_remaining, quality: quality)
      end
  end

  def tick
    # calculate_quality
    # calculate_days_remaining
    # calculate_quality_zero_days if @days_remaining < 0
    # @rose.tick
    @item.tick
  end

  def calculate_days_remaining
    # if !is_legendary?
    #   @days_remaining = @days_remaining - 1
    # end
  end

  def quality
    @item.quality
  end

  def days_remaining
    @item.days_remaining
  end

  def calculate_quality
    if is_normal? && @quality > 0
      @quality = @quality - 1
    elsif is_conjured? && @quality > 0
      @quality = @quality - 2
    elsif is_aged? || is_backstage?
      if @quality < 50
        @quality = @quality + 1
        if is_backstage?
          if @days_remaining < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    end
  end

  def is_normal?
    !is_aged? && !is_legendary? && !is_backstage? && !is_conjured?
  end

  def is_aged?
    (@name =~ /^Aged/) != nil
  end

  def is_legendary?
    (@name =~ /^Legendary/) != nil
  end

  def is_backstage?
    (@name =~ /^Backstage passes/) != nil
  end

  def is_conjured?
    (@name =~ /^Conjured/) != nil
  end

  def calculate_quality_zero_days
    if !is_aged?
      if !is_backstage?
        if @quality > 0
          if !is_legendary?
            @quality = @quality - 1
          end
        end
      else
        @quality = @quality - @quality
      end
    else
      if @quality < 50
        @quality = @quality + 1
      end
    end
  end

  def tick_old
    if !is_aged? and !is_backstage?
      if @quality > 0
        if !is_legendary?
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        @quality = @quality + 1
        if is_backstage?
          if @days_remaining < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    end

    if !is_legendary?
      @days_remaining = @days_remaining - 1
    end

    if @days_remaining < 0
      if !is_aged?
        if !is_backstage?
          if @quality > 0
            if !is_legendary?
              @quality = @quality - 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality = @quality + 1
        end
      end
    end
  end
end
