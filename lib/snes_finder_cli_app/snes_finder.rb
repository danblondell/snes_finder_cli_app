class SnesFinderCliApp::BestBuy
  attr_accessor :url, :doc, :status

  def initialize
    @url = "https://www.bestbuy.com/site/nintendo-entertainment-system-snes-classic-edition/5919830.p?skuId=5919830"
  end

  def scraper
    # headless = Headless.new
    # headless.start
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto @url

    @doc = Nokogiri::HTML.parse(browser.html)

    browser.close
    # headless.destroy

    @status = @doc.css(".cart-button").text
  end

end



class SnesFinderCliApp::Amazon
  attr_accessor :url, :doc, :status

  def initialize
    @url = "https://www.amazon.com/Super-NES-Classic/dp/B0721GGGS9/ref=sr_1_1?ie=UTF8&qid=1503878302&sr=8-1&keywords=snes+classic"
  end

  def scraper
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto @url

    @doc = Nokogiri::HTML.parse(browser.html)

    browser.close

    @doc.css("#add-to-cart-button").empty? ? @status = "Out of Stock" : @status = @doc.css("#add-to-cart-button").attribute("value").value
  end

end



class SnesFinderCliApp::Target
  attr_accessor :url, :doc, :status

  def initialize
    @url = "https://www.target.com/p/nintendo-174-super-nes-classic-edition/-/A-52826093#lnk=sametab"
  end

  def scraper
    # browser = Watir::Browser.new :chrome
    # browser.goto @url

    @doc = Nokogiri::HTML.parse(@url)
    browser.close
    @status = @doc.css(".cart-button").text
  end
end
