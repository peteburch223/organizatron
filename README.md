# Organizatron

Organizatron is a bookmark organizer for groups and organizations.

Bookmarks are added by users and then tagged according to their content. Other users then rate the tags relevance to the content as they use the resource.

## Setup

Clone the repo to your local machine into two separate locations, one for the rails backend and one for the frontend.

```
# In the backend folder
$ git checkout rails-integration-2
$ bundle
$ rake db:setup
$ rails s
```

```
# In the frontend folder
$ git checkout angular-integration
$ open app/index.html
```

## Technologies Used

Rails was used for the backend with Angular on the frontend. Testing was done with RSpec and Capybara for the backend, and the frontend was tested with Karma and Protractor.

## Contributors

* [Pete BURCH](https://github.com/peteburch223)
* [Adil Ali](https://github.com/adilw3nomad)
* [Murilo Dal Ri](https://github.com/MuriloDalRi)
* [Oliver Smit](https://github.com/olmesm)
