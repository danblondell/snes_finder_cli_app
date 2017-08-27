class SnesFinderCliApp::BestBuy
  attr_accessor :url, :doc, :status

  def initialize
    @url = "https://www.bestbuy.com/site/nintendo-entertainment-system-snes-classic-edition/5919830.p?skuId=5919830"
  end

  def scraper
    # @doc = Watir::Browser.start @url

    browser = Watir::Browser.new :chrome
    browser.goto @url

    @doc = Nokogiri::HTML.parse(browser.html)
    @status = @doc.css(".cart-button").text
  end
  binding.pry

end



class SnesFinderCliApp::Amazon
  attr_accessor :url

  def initialize
    @url = "https://www.amazon.com/Super-NES-Classic/dp/B0721GGGS9/ref=sr_1_1?ie=UTF8&qid=1503868738&sr=8-1&keywords=snes+classic"
  end
end



class SnesFinderCliApp::Target
  attr_accessor :url

  def initialize
    @url = "https://www.target.com/p/nintendo-174-super-nes-classic-edition/-/A-52826093#lnk=sametab"
  end
end
