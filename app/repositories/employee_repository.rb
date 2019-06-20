class EmployeeRepository < BaseRepository
  undef_method :add

  def all_delivery_guys
    @elements.select { |element| element.delivery_guy? }
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  private

  def build_element(row)
    Employee.new(row)
  end
end
