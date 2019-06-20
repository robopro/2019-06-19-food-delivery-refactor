class BaseView
  def display(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1}. #{element}"
    end
  end

  def ask_for_string(attr)
    puts "What is the #{attr}?"
    gets.chomp
  end

  def ask_for_number(attr)
    puts "what is the #{attr}?"
    gets.chomp.to_i
  end
end
