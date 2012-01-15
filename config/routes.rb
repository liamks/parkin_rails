ParkinRails::Application.routes.draw do


  devise_for :users

  get 'admin' => 'news_items#index', :as => 'admin'
  #services

  resources :page_items

  #profile
  actions = ['show','edit','update']
  pages = [
    {:url => 'profile',:controller => 'profiles'},
    {:url => 'services',:controller => 'services'},
    {:url => 'history',:controller => 'histories'},
    {:url => 'opportunities',:controller => 'opportunities'},
    {:url => 'people',:controller => 'people'},
    {:url => 'service',:controller => 'services'},
    {:url => 'awards',:controller => 'awards'},
  ]
 
  pages.each do |page|
    actions.each do |action|
      url = "#{page[:url]}/#{action}"
      controller_action = "#{page[:controller]}##{action}"
      if action == 'update'
        post url => controller_action
      else
        url = page[:url] if action == 'show'
        get url => controller_action
      end
    end
  end


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


    resources :pages, :path => '/admin/pages'
    post "/admin/pages/update_order" => 'pages#update_order'

  
  resources :clients

  resources :news_items, :path => 'news', :as => 'news' do
   collection do
     get 'all' => 'news_items#news'
   end

   collection do
     get 'archives' => 'news_items#archives'
   end
  end

  

  root :to => 'home_page#show'


end
