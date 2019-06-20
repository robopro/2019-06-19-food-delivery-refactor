class MealsController < BaseController
  def initialize(meal_repository)
    super(meal_repository)
    @view = MealsView.new
  end

  def add
    attributes = {
      name: @view.ask_for_string(:name),
      price: @view.ask_for_number(:price)
    }

    @repository.add(Meal.new(attributes))
  end
end
