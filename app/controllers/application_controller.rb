class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def shifts
    { "1": "7:30", "2": "9:30", "3": "13:30", "4": "15:30" }
  end
end
