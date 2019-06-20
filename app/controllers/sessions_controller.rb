class SessionsController < BaseController
  def initialize(employee_repository)
    super(employee_repository)
    @view = SessionsView.new
  end

  def login
    username = @view.ask_for_string(:username)
    password = @view.ask_for_string(:password)
    employee = @repository.find_by_username(username)

    if employee && employee.password == password
      @view.welcome
      employee
    else
      @view.incorrect_credentials
      login
    end
  end
end
