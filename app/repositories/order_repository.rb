class OrderRepository < BaseRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository

    super(csv_path)
  end

  def undelivered_orders
    orders.reject { |order| order.delivered? }
  end

  def employees_undelivered_orders(employee)
    undelivered_orders.select { |order| order.employee == employee }
  end

  def mark_as_delivered(id)
    find(id).deliver!
    save_csv
  end

  private

  attr_reader :meal_repository, :employee_repository, :customer_repository, :meals, :employees, :customers

  def orders
    @elements
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == "true"
    row[:meal] = meal_repository.find(row[:meal_id].to_i)
    row[:employee] = employee_repository.find(row[:employee_id].to_i)
    row[:customer] = customer_repository.find(row[:customer_id].to_i)
    Order.new(row)
  end
end
