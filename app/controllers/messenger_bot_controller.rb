class MessengerBotController < ActionController::Base
  def message(event, sender)
    profile = sender.get_profile(field)
    # default field [:locale, :timezone, :gender, :first_name, :last_name, :profile_pic]

    sender.reply({ text: "Hi #{profile.first_name}, your message is #{event['message']['text']}" })
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