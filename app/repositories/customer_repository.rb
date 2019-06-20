class CustomerRepository < BaseRepository
  private

  def build_element(row)
    Customer.new(row)
  end
end
