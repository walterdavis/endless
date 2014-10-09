## README

Demonstrates a combination of paging and lazy-loading to show ~20K versioned objects in a single page. 

* Uses Kaminari to page the objects by 25s
* Uses a tail-call Ajax load scheme to request the next 25 after the first has loaded
* Also shows scroll-driven lazy-loading, just because
* Also shows a caching scheme that allows versions to be shown without loading all of them at once

### To Run:
(Ruby 2.1 and Rails 4.1 should be installed before you try this...)

* Terminal: `bundle install`
* Terminal: `rake db:create`
* Terminal: `rake db:migrate`
* Terminal: `rake db:seed`
* Terminal: `rails server`
* Visit: <http://localhost:3000/>