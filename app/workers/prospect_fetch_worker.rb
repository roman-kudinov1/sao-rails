class ProspectFetchWorker
  include Sidekiq::Worker

  def perform(id)
	
	prospect = Prospect.find(id)
    
    p "-> source_url=#{prospect.source_url}"

    response = HTTParty.get(prospect.source_url)

    if response.code == 200
    	doc = Nokogiri::HTML(response.body)
    	prospect.status = :fetched
    	prospect.name = get_value_from_css(doc, 'h1.listing-name') || prospect.name
    	prospect.email = get_value_from_css(doc, 'span.email .value a') || prospect.email
    	prospect.mobile = get_value_from_css(doc, 'span.mobile .value a') || prospect.mobile
    	prospect.phone = get_value_from_css(doc, 'span.phone .value a') || prospect.phone
    	prospect.fax = get_value_from_css(doc, 'span.fax .value span') || prospect.fax
    	prospect.website = get_value_from_css(doc, 'span.url .value a') || prospect.website
    	prospect.other = ""
    	prospect.fetches = (prospect.fetches || 0) + 1 
    	prospect.last_fetch = Time.current
    	prospect.save
    else 
    	puts "Got a #{response.code} response.code"
    end
  end

  def get_value_from_css(doc, v)

  	nodes = doc.css(v)

  	if nodes.length == 0
  		nil
  	else
  		nodes.first.content.strip
  	end
  end
end