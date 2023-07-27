require "csv"
require_relative "../models/meal"
require_relative "base_repository"
class MealRepository < BaseRepository


  def headers
    ["id", "name", "price"]
  end

  def record_to_row(meal)
    [meal.id, meal.name, meal.price]
  end

  def row_to_record(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    return Meal.new(row)
  end
end