class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_s
    done = delivered? ? '[X]' : '[ ]'
    "Customer: #{customer.name} | Meal: #{meal.name} | Employee: #{employee.username} | Delivered: #{done}"
  end

  def to_csv
    [id, delivered?, meal.id, customer.id, employee.id]
  end

  def self.headers
    %i[id delivered meal_id employee_id customer_id]
  end
end
