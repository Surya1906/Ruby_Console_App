# Book Class
class Book
  @book_count = 0

  def self.book_count
    @book_count
  end

  def initialize(book_title, book_price, book_description)
    time = Time.new
    @book_title = book_title
    @book_price = book_price
    @book_description = book_description
    @book_submitted = "#{time.day}/#{time.month}/#{time.year}"
    self.class.instance_variable_set(:@book_count, self.class.book_count + 1)
  end

  def return_title
    @book_title
  end

  def return_price
    @book_price.to_s
  end

  def return_description
    @book_description
  end

  def return_submitted
    @book_submitted
  end
end

def display_menu
  puts 'Welcome to the Book Store!'
  puts 'Please select an option:'
  puts '1. Add a book'
  puts '2. Display Total Book Count'
  puts '3. Exit the Application'
end

def user_choice
  print 'Enter your choice: '
  gets.chomp.to_i
end

loop do
  display_menu
  choice = user_choice
  puts
  case choice
  when 1
    print 'Enter the book title: '
    title = gets.chomp
    puts
    print 'Enter the book price: '
    price = gets.chomp.to_i
    puts
    print 'Enter the book decription: '
    decription = gets.chomp
    puts

    book1 = Book.new(title, price, decription)
    file = File.open('bookdata.txt', 'a')
    file.puts "Title: #{book1.return_title}, Price: #{book1.return_price}, Description: #{book1.return_description}, Date of Submission: #{book1.return_submitted}"
    file.close

  when 2
    puts "Total Number of books is #{Book.book_count}"
    puts
  when 3
    puts 'Exiting the app. Goodbye!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
