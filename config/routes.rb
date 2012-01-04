ParkinRails::Application.routes.draw do



  devise_for :users

  get 'admin' => 'news_items#index', :as => 'admin'
  #services
  get "service" => 'services#show'
  get "service/edit" => 'services#edit'
  post "service/update" => 'services#update'

  delete "file_uploads/destroy/:id" => "file_uploads#destroy", :as => 'remove_image'

  #homepage
  get "homepage/show" => "home_page#show"
  get "homepage/edit" => "home_page#edit"
  post "homepage/update" => "home_page#update", :as => 'home_page_update'

  get "projects/main" => 'projects#main', :as => 'projects_main'
  resources :projects do
    collection do
      get 'all' => 'projects#all'
      get 'highlights' => 'projects#highlights'
    end
  end
  resources :pages
  resources :clients

  resources :news, :controller => 'news_items' do
   collection do
     get 'all' => 'news_items#news'
   end

   collection do
     get 'archives' => 'news_items#archives'
   end
  end

  

  root :to => 'home_page#show'


end
