# Search Engine Project

This is a search engine basic implementation using `pg_search` gem. It
connects also to a DB in mongo where it stores all the searches for 
statistics.

This page is [deployed on Heroku](https://search-engine-ftovaro.herokuapp.com/)

The search a user makes is saved after 5 seconds of inactivity on the
input field

When a user enters the page a uuid is assigned to that user in form
of a cookie, so when a search is made and saved is related to that token,
that helps to identify what a single person had searched

To access to the statistics page navigate to: `/statistics`

The project is made with RoR on the back and VueJS on the front

All the frontend components and styles are from [Vuetify](https://vuetifyjs.com/en/).

## Endpoints

**Get some statistics from Mongo**

| url | HTTP method | description | status |
|---|---|---|---|
| `/api/v1/statistics` | GET | Get statistics | 200 |


**Get articles from a query**

| url | HTTP method | description | status |
|---|---|---|---|
| `/api/v1/articles?query=${example}` | GET | Get articles | 200 |

**Params**

| key | value |
|---|---|
| **`query`** | The topics you want articles |


**Save a search**

| url | HTTP method | description | status |
|---|---|---|---|
| `/api/v1/search` | POST | Save a search | 200 |

**Params**

| key | value |
|---|---|
| **`query`** | What the user searched |
| **`device`** | Device user is using the page |

**Bonus: Get all the searches**

This is used to look at all the searches all users have made

| url | HTTP method | description | status |
|---|---|---|---|
| `/api/v1/all-searches` | GET | Get all the searches | 200 |

## Dependencies

* Dependencies version
    - Ruby 3.0.1
    - Rails 6.1.4.4
    
* Database creation
    - `rails db:create db:migrate db:seed` 

* How to run the test suite
    - `rspec`

## How to make it ​high-volume​ ##

I'd use [Algolia](https://www.algolia.com/) with [InstantSearch](https://www.algolia.com/products/instantsearch/) to manage the search in the webpage
and they also give nice statistics