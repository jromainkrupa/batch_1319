require_relative "../views/order_view"
require_relative "../views/meal_view"
require_relative "../views/employee_view"
require_relative "../views/customer_view"
class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrderView.new
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @employee_view = EmployeeView.new
  end

  def list_undelivered_orders
    # 1. Retrouver les undelivred orders
    orders = @order_repository.undelived_orders
    # 2. Les afficher
    @view.display_orders(orders)
  end

  def add
    meals = @meal_repository.all
    @meal_view.display(meals)
    meal_index = @view.ask_for("meal").to_i - 1
    meal = meals[meal_index]
    
    customers = @customer_repository.all
    @customer_view.display(customers)
    customer_index = @view.ask_for("customer").to_i - 1
    customer = customers[customer_index]
    
    employees = @employee_repository.all
    @employee_view.display(employees)
    employee_index = @view.ask_for("employee").to_i - 1
    employee = employees[employee_index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end
end