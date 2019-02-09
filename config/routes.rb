Rails.application.routes.draw do
  namespace :api do
    api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.michaelferretti.com; version=1"}) do
      # match '/foos.(:format)' => 'foos#index', :via => :get
      # match '/foos_no_format' => 'foos#index', :via => :get
      # resources :bars
    end
  end
end
