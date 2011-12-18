class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :setup_links

  def setup_links
    links = {'news_items' => {:link => '/news', :text => 'News'},
             'projects' => {:link => '/projects', :text => 'Projects'},
             'pages' => {:link => '/pages', :text => 'Pages'}}

    controller = params[:controller]
    controller = 'pages' if ['home_page', 'services'].include?(controller)
    links[controller][:css] = 'class="active"'
    output = []
    links.keys.each do |link|
      output << "<li id='#{}' #{links[link][:css]}><a href='#{links[link][:link]}'>#{links[link][:text]}</a></li>"
    end

    output.join('') 
        
  end
  
end
