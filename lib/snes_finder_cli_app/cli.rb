class SnesFinderCliApp::CLI
  def initialize
    @bestbuy = SnesFinderCliApp::BestBuy.new
    @amazon = SnesFinderCliApp::Amazon.new
    @target = SnesFinderCliApp::Target.new
  end

  def call
    puts "\nLet's see if the SNES Classic is in available for purchase."

    puts "\nChecking Best Buy. This might take a minute..."
    bestbuy = @bestbuy.scraper
    puts "Now checking Amazon..."
    amazon = @amazon.scraper
    puts "Checking Target now, just a bit longer..."
    target = @target.scraper

    puts "\nHere are the current listings for SNES Classic"
    puts "1. Best Buy - #{bestbuy}"
    puts "2. Amazon - #{amazon}"
    puts "3. Target - #{target}"

    puts "\nType the number of the link you are interested in, or type refresh or exit."

    now_what
  end

  def now_what

    input = gets.strip

    if input.downcase == "exit"
      puts "Come again soon!"
    elsif input.downcase == "refresh"
      call
    elsif input.to_i == 1
      puts "\n#{@bestbuy.url}\n"
      puts "\nAnything else?"
      now_what
    elsif input.to_i == 2
      puts "\n#{@amazon.url}\n"
      puts "\nAnything else?"
      now_what
    elsif input.to_i == 3
      puts "\n#{@target.url}\n"
      puts "\nAnything else?"
      now_what
    else
      puts "Type either 1-3, refresh, or exit."
      now_what
    end
  end
end
