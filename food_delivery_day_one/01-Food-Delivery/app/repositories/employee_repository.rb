require "csv"
require_relative "../models/employee"
require_relative "base_repository"
class EmployeeRepository < BaseRepository
  def headers
    ["id", "username", "password"]
  end

  def record_to_row(employee)
    [employee.id, employee.username, employee.password]
  end

  def row_to_record(row)
    row[:id] = row[:id].to_i
    return Employee.new(row)
  end

  def find_by_username(username)
    @records.find { |employee| employee.username == username }
  end

end