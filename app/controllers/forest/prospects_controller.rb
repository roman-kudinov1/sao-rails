class Forest::ProspectsController < ForestLiana::ApplicationController
  
  def harvest_sa
    self.harvest("SA")
    head :ok, content_type: "text/html"
  end

  def harvest_sarl
  	self.harvest("SARL")
  	head :ok, content_type: "text/html"
  end

  def harvest(search_string)
  	ProspectsListHarvestWorker.perform_async("https://tel.local.ch/fr/q/#{search_string}.html?rid=5Rzm&typeref=bus&where=")
  	head :ok, content_type: "text/html"
  end

end