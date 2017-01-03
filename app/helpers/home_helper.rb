module HomeHelper
  def should_disable?(data)
    date_range_to_yesterday.include?(data['date']) ||
      (Date.today.strftime("%d-%m-%Y") == data['date'] && 
        shift_now > data['shift'])
  end

  def date_range_to_yesterday
    date_from = Date.new(2016, 12, 16)
    date_to = Date.yesterday
    date_range = (date_from..date_to).map { |date| date.strftime("%d-%m-%Y") }
  end

  def shift_now
    time_now = Time.now.in_time_zone("Hanoi").strftime("%k:%M")

    if time_now > "15:30"
      "4"
    elsif time_now > "13:30"
      "3"
    elsif time_now > "9:30"
      "2"
    else
      "1"
    end
  end
end
