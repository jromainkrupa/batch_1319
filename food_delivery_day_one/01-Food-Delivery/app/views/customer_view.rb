require_relative "base_view"
class CustomerView < BaseView
  def print_sentence(customer, index)
    "#{index + 1} - #{customer.name} (#{customer.address})"
  end
end
