Rails.application.routes.draw do
  root 'static_pages#home'

	namespace :forest do
	  post '/actions/get-sa' => 'prospects#harvest_sa'
	  post '/actions/get-sarl' => 'prospects#harvest_sarl'
	end
	
	require 'sidekiq/web'
	mount Sidekiq::Web => '/sidekiq'

  mount ForestLiana::Engine => '/forest'

end
