require_relative "../views/meal_view.rb"
require_relative "../models/meal"
class MealsController
  def initialize(meal_repository)
    @meal_view = MealView.new
    @meal_repository = meal_repository
  end

  def list
    meals = @meal_repository.all
    @meal_view.display(meals)
  end

  def add
    name = @meal_view.ask_for("name")
    price = @meal_view.ask_for("price").to_i
    new_meal = Meal.new(name: name, price: price)
    @meal_repository.create(new_meal)
  end

  def destroy
    list
    id = @meal_view.ask_for("id to suppress").to_i
    @meal_repository.delete(id)
  end
end