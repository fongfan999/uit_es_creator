class MessengerBotController < ActionController::Base
  def message(event, sender)
    origin_link = event['message']['text']

    sender.reply({ text: "How are you doing today? Please be patient!" })
    sender.reply({ text: "Short link: #{Accesstrade.generate_short_link(origin_link)}" })
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