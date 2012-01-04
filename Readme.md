# Parkin Rails

## Getting Started

Run the following command within the parkin_rails folder

    bundle install
    rake db:migrate
    rake db:seed

This will populate the database with some seed data (found in `db/seeds.rb`) 

## Misc

Below I've provided the location of the main front-end layout file and the location of 
of the template files for each front-end page. I haven't added everything - I thought
I would wait until I get back from BC, at that point you'll have a better idea
of what needs to be done. The back end is not password protected yet, I'll do that when
I get back. For now you can go to `/pages` to view the back-end.

### /pages

I'm displaying the pages in a `ul` which will allow me later to add drag-and-drop reording.
The New Page button currently does nothing.

### /news 

When you create or edit a news_item you can add photos. Right now you have to add a single
photo then click 'create news item'/'edit news item' to upload it. This interaction
is clunky and will be done via ajax when I'm back.

### /homepage/edit

Currently you can add images (click save changes to add image) and you can reorder
the images and update their information. You can also delete images. The interface
looks crapy, but I'm sure we can come up with something nicer in January.

## File Locations

front end layout: `app/views/layouts/front.html.haml`

front end css: `app/assets/stylesheets/front.css.scss`

### Home Page
url: /

template: `app/views/home_page/show.html.haml`

### Service Page
url: /service

template: `app/views/services/show.html.haml`


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

## Back End
 url: `/admin`