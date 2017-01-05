module HomeHelper
  def should_disable?(date_range_to_yesterday, shift_now, data)
    date_range_to_yesterday.include?(data['date']) ||
      (Date.today.strftime("%d-%m-%Y") == data['date'] && 
        shift_now > data['shift'])
  end
end
