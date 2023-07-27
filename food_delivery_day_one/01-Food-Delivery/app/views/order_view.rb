require_relative "base_view"
class OrderView
  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - meal: #{order.meal.name} customer: #{order.customer.name} employee: #{order.employee.username}"
    end
  end

  def ask_for(stuff)
    puts stuff + "?"
    print "> "
    gets.chomp
  end
end
