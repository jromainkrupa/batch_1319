require "csv"
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository
  def row_to_record(row)
    row[:id] = row[:id].to_i
    return Customer.new(row)
  end

  def record_to_row(customer)
    [customer.id, customer.name, customer.address]
  end

  def headers
    ["id", "name", "address"]
  end

end