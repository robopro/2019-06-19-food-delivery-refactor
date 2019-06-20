class SessionsView < BaseView
  undef_method :display, :ask_for_number

  def welcome
    puts "You're successfully logged in"
  end

  def incorrect_credentials
    puts 'Incorrect credentials, try again'
  end
end
