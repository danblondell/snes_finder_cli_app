class SnesFinderCliApp::CLI
  def initialize
    @bestbuy = SnesFinderCliApp::BestBuy.new
    @amazon = SnesFinderCliApp::Amazon.new
    @target = SnesFinderCliApp::Target.new
  end

  def call
    puts "Here are the current listings for SNES Classic"
    puts "1. Best Buy - out of stock"
    puts "2. Amazon - out of stock"
    puts "3. Target - PRE-ORDER!"
    puts "\n"
    puts "Press ENTER to refresh or type the number of the link you are interested in, or type exit to quit."

    input = gets.strip

    if input.downcase == "exit"
      puts "Come again soon!"
    elsif input.to_i == 1
      puts "#{@bestbuy.url}"
    elsif input.to_i == 1
      puts "Amazon URL"
    elsif input.to_i == 2
      puts "Target URL"
    else
      call
    end
  end
end
