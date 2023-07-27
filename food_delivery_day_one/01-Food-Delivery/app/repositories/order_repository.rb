class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @csv_file = csv_file
    load_csv
  end

  def all
    @orders
  end

  def create(new_order)
    new_order.id = @next_id
    @orders << new_order
    @next_id += 1
    save_csv
  end

  def undelived_orders
    @orders.reject {|order| order.delivered?}
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id","delivered","meal_id","customer_id","employee_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      delivered = row[:delivered] == "true"
      meal = @meal_repository.find(row[:meal_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      
      @orders << Order.new(id: id, delivered: delivered, customer: customer, meal: meal, employee: employee)
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end
end