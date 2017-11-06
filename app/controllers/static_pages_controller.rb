class StaticPagesController < ApplicationController
  def home
  	# ProspectFetchWorker.perform_async(3)
  	# ProspectsListHarvestWorker.perform_async("https://tel.local.ch/fr/q/SA.html?rid=5Rzm&typeref=bus&where=")
  	# ProspectsListHarvestWorker.perform_async("https://tel.local.ch/fr/q/Gravesano/SA.html?page=8&rid=8NPe")

  end
end
