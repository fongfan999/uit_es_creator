require "wombat"

namespace :notifs do
  desc "Update notifications on UIT daa"
  task :update do
    final_data = []

    (0..10).each_with_index do |page, index|

      data = Wombat.crawl do
        base_url "https://daa.uit.edu.vn/"

        if index.zero?
          path "/thong-bao-chung"
        else
          path "/thong-bao-nghi-bu?page=#{page}"
        end

        off_class_notifs("css=#block-system-main .content .view-content
          .views-row", :iterator) do

          title 'css=h2'
          link 'xpath=.//@href' do |path|
            "https://daa.uit.edu.vn" + path
          end
          submitted css: ".submitted"
          content css: ".field-items"

        end
      end

      final_data << data['off_class_notifs']
    end

    File.open(Rails.root.join('public', 'notifs_data.json'), "w") do |f|
      f.write(final_data.flatten.to_json)
    end
  end
end