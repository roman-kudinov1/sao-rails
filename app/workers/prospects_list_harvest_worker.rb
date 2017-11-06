class ProspectsListHarvestWorker
  include Sidekiq::Worker

  def perform(target_url)

    p "-> target_url=#{target_url}"

    response = HTTParty.get(target_url)

    if response.code == 200
      doc = Nokogiri::HTML(response.body)
      
      doc.css('h2 a.details-entry-title-link').each do |link|
        url = link.css("@href")
        url_sanitized = url.to_s.split("?")[0]
        new_entry = Prospect.find_or_initialize_by(source_url: url_sanitized)
        if new_entry.save()
          ProspectFetchWorker.perform_async(new_entry.id.to_s)
        end
      end

      next_page_item = doc.at_css(".pagination span.next a")

      if next_page_item
        next_page_url = "https://tel.local.ch" + next_page_item['href'].to_str
        ProspectsListHarvestWorker.perform_async(next_page_url)
      end
    else 
      puts "Got a #{response.code} response.code"
    end
  end
end
