module HomeHelper
  def should_disable?(date_range_to_yesterday, shift_now, data)
    date_range_to_yesterday.include?(data[:date]) ||
      (Date.today.strftime("%d-%m-%Y") == data[:date] && 
        shift_now > data[:shift])
  end

  def next_es_title(classes)
    next_es = next_es(classes)

    next_es.slice('name', 'id_number', 'room')
      .map(&:last).join(' - ') + "(#{next_es['sum']})"
  end

  def next_es_time
    Time.zone.parse(format_time_of_cl(next_es(@classes))).to_i * 1000 
  rescue
    nil
  end

  def next_es(classes)
    classes.find { |cl| Time.current < time_of_cl(cl) }
  end

  def time_of_cl(cl)
    Time.zone.parse format_time_of_cl(cl)
  end

  def format_time_of_cl(cl)
    "#{@shifts[cl['shift'].to_s.to_sym]}, #{cl['date']}"
  end
end
