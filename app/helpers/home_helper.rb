module HomeHelper
  def should_disable?(date_range_to_yesterday, shift_now, data)
    date_range_to_yesterday.include?(data['date']) ||
      (Date.today.strftime("%d-%m-%Y") == data['date'] && 
        shift_now > data['shift'])
  end

  def shift_to_time(shift)
    { "1": "7:30", "2": "9:30", "3": "13:30", "4": "15:30" }[:"#{shift}"]
  end
end
