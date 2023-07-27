require_relative '../views/session_view'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def sign_in
    # 1. demande le username
    username = @view.ask_for("username")
    # 2. demande password
    password = @view.ask_for("password")

    employee = @employee_repository.find_by_username(username)

    return employee if employee && employee.password == password

    @view.wrong_credentials
    sign_in
  end
end