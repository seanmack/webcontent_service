Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :site, controller: :site
    end
  end
end
