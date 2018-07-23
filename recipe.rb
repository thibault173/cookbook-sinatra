class Recipe
  attr_reader :name, :description, :prep_time, :rating

  def initialize(name, description, prep_time, mark, rating = '')
    @name = name
    @description = description
    @prep_time = prep_time
    @mark = mark == "true"
    @rating = rating unless rating.empty?
  end

  def mark_as_done
    @mark = true
  end

  def mark?
    @mark
  end
end
