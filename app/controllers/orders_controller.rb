class OrdersController < BaseController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    super(order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    undelivered_orders = @repository.undelivered_orders
    view.display(undelivered_orders)
  end

  def list_my_orders(employee)
    orders = @repository.employees_undelivered_orders(employee)
    view.display(orders)
  end

  def add
    meal = get_meal
    customer = get_customer
    delivery_guy = get_delivery_guy

    order = Order.new(meal: meal, customer: customer, employee: delivery_guy)
    @repository.add(order)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    id = @view.ask_for_number(:id)
    @repository.mark_as_delivered(id)
  end

  private

  def get_meal
    view.display(@meal_repository.all)
    meal_index = @view.ask_for_number(:index)
    @meal_repository.all[meal_index]
  end

  def get_customer
    @view.display(@customer_repository.all)
    customer_index = @view.ask_for_number(:index)
    @customer_repository.all[customer_index]
  end

  def get_delivery_guy
    @view.display(@employee_repository.all_delivery_guys)
    delivery_guy_index = @view.ask_for_number(:index)
    @employee_repository.all_delivery_guys[delivery_guy_index]
  end
end
