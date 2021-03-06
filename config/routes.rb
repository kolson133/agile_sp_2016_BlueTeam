Rails.application.routes.draw do

  root "home#index"

  get 'shared_decks', to: 'shared_decks#index', as: :shared_decks
  patch 'decks/:deck_id/share_deck', to: 'decks#share', action: :share, as: :share_deck
  patch 'shared_decks/:deck_id/remove_shared', to: 'decks#remove_shared', action: :remove_shared, as: :remove_shared

  get 'sort_category', to: 'sort_category#index', as: :sort_category

  resources :decks do
    resources :cards
  end

  post 'decks/:deck_id/cards/:id/disable_card' => 'cards#disable_card', :as => :disable_deck_card


  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
