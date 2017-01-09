class MessengerBotController < ActionController::Base
  def message(event, sender)
    origin_link = event['message']['text']

    if origin_link =~ /http/
      sender.reply({ text: "How are you doing today. Please be patient!" })
      sender.reply({ text: "Short link: #{Accesstrade.generate_short_link(origin_link)}" })
      sender.reply({ text: "Product link: https://pub.accesstrade.vn/deep_link/4505309943460540043?url=#{origin_link}&utm_source=facebook" })
    else
      sender.reply({ text: "Đường dẫn không hợp lệ. Vui lòng nhập lại một đường dẫn khác!" })
    end
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