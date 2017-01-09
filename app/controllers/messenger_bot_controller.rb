class MessengerBotController < ActionController::Base
  def message(event, sender)
    # profile = sender.get_profile(:first_name)
    sender.reply({ text: "How are you doing today. Please be patient!" })
  
    @links = Accesstrade.generate_product_link(event['message']['text'])
    sender.reply({ text: "Short link: #{@links['short_link']}" })
    sender.reply({ text: "Product link: #{@links['product_link']}" })
  end

  def delivery(event, sender)
  end

  def postback(event, sender)
    # payload = event["postback"]["payload"]
    # case payload
    # when :something
    #   #ex) process sender.reply({text: "button click event!"})
    # end
    sender.reply({text: "button click event!"})
  end
end