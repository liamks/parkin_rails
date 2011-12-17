# Parkin Rails

## Getting Started

    rake db:migrate
    rake db:seed

This will populate the database with some seed data (found in `db/seeds.rb`) 

## File Locations

front end layout: `app/views/layouts/front.html.haml`

front end css: `app/assets/stylesheets/front.css.scss`

### Home Page
url: /

template: `app/views/home_page/show.html.haml`

### Projects (landing page)
url: /projects/main

template: `app/views/projects/main.html.haml`

### Projects (single project)
url: /projects/:id

template: `app/views/projects/show.html.haml`

### Projects (highlights)
url: /projects/highlights

template: `app/views/projects/highlights.html.haml`

### Projects (View All)
url: /projects/all

template: `app/views/projects/all.html.haml`

### News (one story)
url: /news/:id

template: `app/views/news_items/show.html.haml`

### News (all stories) 
url: /news/all

template: `app/views/news_items/all.html.haml`

### News (Archives)
url: /news/archives

template: `app/views/news_items/archives.html.haml`