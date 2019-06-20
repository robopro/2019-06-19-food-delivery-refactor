class CustomersController < BaseController
  def initialize(customer_repository)
    super(customer_repository)
    @view = CustomersView.new
  end

  def add
    attributes = {
      name: @view.ask_for_string(:name),
      address: @view.ask_for_string(:address)
    }

    @repository.add(Customer.new(attributes))
  end
end
