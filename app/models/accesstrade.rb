require "httparty"

class Accesstrade
  include HTTParty

  def self.generate_short_link(origin_link)
    # Get link and parse to json
    JSON.parse(
      post('http://api.accesstrade.vn/me/product_links', {
        body: {
          # access_key: ENV['AT_ACCESS_KEY'],
          access_key: "BDWnWb-g6SJ534r-jSwcMP_mvhcznH_0",
          url: origin_link,
          utm_source: "facebook"
        }
      }).body
    )['short_link']
  end
end