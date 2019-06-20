class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(**attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_s
    "Name: #{name} | Price: #{price}"
  end

  def to_csv
    [id, name, price]
  end

  def self.headers
    %i[id name price]
  end
end
