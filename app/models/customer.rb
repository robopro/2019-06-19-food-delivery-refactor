class Customer
  attr_reader :name, :address
  attr_accessor :id

  def initialize(**attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_s
    "Name: #{name} | Address: #{address}"
  end

  def to_csv
    [id, name, address]
  end

  def self.headers
    %i[id name address]
  end
end
