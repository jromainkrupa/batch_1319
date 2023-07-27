require_relative "../views/customer_view.rb"
require_relative "../models/customer"
class CustomersController
  def initialize(customer_repository)
    @customer_view = CustomerView.new
    @customer_repository = customer_repository
  end

  def list
    customers = @customer_repository.all
    @customer_view.display(customers)
  end

  def add
    name = @customer_view.ask_for("name")
    address = @customer_view.ask_for("address")
    new_customer = Customer.new(name: name, address: address)
    @customer_repository.create(new_customer)
  end
end