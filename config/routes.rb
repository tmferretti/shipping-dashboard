Rails.application.routes.draw do
  namespace :api do
    api_version(:module => "V1", :header => {:name => "Accept", :value => "application/json, application/vnd.negotiatus-challenge.com; version=1"}) do
      shallow do
        resources :vendors do
          resources :orders do
            resources :line_items
            resources :shipments do
              resources :addresses
            end
          end

          resources :shipments, :only => :index
          resources :addresses, :only => [:create, :index]
        end
      end
    end
  end
end
