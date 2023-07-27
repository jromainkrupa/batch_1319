require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/order_repository"

require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/sessions_controller"
require_relative "app/controllers/orders_controller"

require_relative "router"

require_relative "app/models/order"

meal_csv_file = File.join(__dir__, "data/meals.csv")
customer_csv_file = File.join(__dir__, "data/customers.csv")
employee_csv = File.join(__dir__, "data/employees.csv")
order_csv = File.join(__dir__, "data/orders.csv")

meal_repository = MealRepository.new(meal_csv_file)
customer_repository = CustomerRepository.new(customer_csv_file)
employee_repository = EmployeeRepository.new(employee_csv)

meal_controller = MealsController.new(meal_repository)
customer_controller = CustomersController.new(customer_repository)
session_controller = SessionsController.new(employee_repository)

order_repository = OrderRepository.new(order_csv, meal_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)


router = Router.new(meal_controller, customer_controller, session_controller, orders_controller)
router.run

