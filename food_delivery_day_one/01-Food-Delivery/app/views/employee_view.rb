require_relative "base_view"
class EmployeeView < BaseView

  def print_sentence(employee, index)
    "#{index + 1} - #{employee.username}"
  end
end
