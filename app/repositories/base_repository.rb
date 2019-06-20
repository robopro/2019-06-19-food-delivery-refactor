require 'csv'

class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_path)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def add(element)
    element.id = @next_id
    @elements << element
    save_csv
    @next_id += 1
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << build_element(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_csv
      end
    end
  end
end
