class Api::V1::DaaController < Api::V1::ApplicationController
  def datasource
    file_path = Rails.root.join('public', 'daa_data.json')
    @datasource = MultiJson.load(file_path)

    if stale?(@datasource)
      render json: @datasource
    end
  end
end
