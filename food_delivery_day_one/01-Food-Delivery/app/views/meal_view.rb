require_relative "base_view"
class MealView < BaseView

  def print_sentence(meal, index)
    "#{index + 1} - #{meal.name} (#{meal.price}€)"
  end
end
