# Negotiatus Challenge
## Simple Shipment/Order Admin Dashboard
##### Author: Michael Ferretti

<br />

#### Initial Setup:

>The app was built with a rails 5.2 api backend sharing the stack with a semi-seperated reactjs frontend. I went this route because I believe, for a tech challenge, this allows for a good balance between showcasing api development and the need for simplicity (i.e configuring CORS, alternating between codebases, deploying two apps, etc.)
  
<br />

The requirements for the application are straightforward:

1. A form to input order number, the associated vendor, and the tracking number for the order, and the address the order is shipping to
2. A seed file to seed the database with thousands of orders
3. An index to see all not-delivered orders 
    - map showing destinations of all active orders
4. Reporting on shipments that are outside a “normal” delivery time for vendors “Normal,” “Not normal,” “Very late” (delivery times should be calculated based off past data)
5. The index should make it easy to see which packages are arriving late and need human attention

<br />

I created the rails app as api-only and had the generator config the postgres connection:

<br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`rails new shipping-dashboard --api --database=postgresql -T`

<br />

Then, I created the react client under the app directory using facebook's create-react-app. 

_Note: I prefer Walmart's Electrode, it has a very powerful suite of tools perfect for modularity among other things. However, I chose to go with create-react-app because its simple, quick, and electrode would be overkill for a tech challenge (in my opinion)._

<br />

>Typically, the first thing I do when building a new rails app is clean up the gemfile by deleting all the unecessary gems, boilerplate comments, and limit the gem versions to the subsets that were used during development. I do this to insulate the codebase from problems that might arise from unintended or accidental updates.

<br />

Initial cleanup aside, I start with building out the data-only application such as generating the models, writing validations to prevent the injection of bad data, writing scopes for the models if needed, testing the connection.

<br />

#### Building the API Backend:


**Models:** Given the requirements, there will be only a couple models off the bat: Vendor, Order, LineItem, Shipment, and Address.


>Line items weren't specified, but every order needs to have _something that was ordered_. Likewise, shipment/address were also not directly specified, but have been abstracted into their own models in order to take advantage of Rails' wonderful ActiveRecord ORM layer

<br />

_Note: there is a nice entity relationship diagram in the app's top level directory named "erd.pdf"_

<br />

**Seeding Fake Data:** Once the models are ready to use we need to populate the database with enough data develop on. Personally, I find the faker gem to be perfectly adequate.

>With seed files (especially ones that will populate thousands of rows) I will include a `Model.destroy_all` before each block of model instantiation so as not to have a wild amount of data.

Implementing the bonus map introduced an interesting little hitch with the seeds file. Since I needed actual addresses to show on a map, I needed to generate a lot of _valid_ addresses, something that Faker is not currently capable of doing. So after a quick google search I found a json file originating from [OpenAddresses](http://results.openaddresses.io/) dataset. Perfect. 

<br />

**Versioning:** There are a few approaches when it comes to versioning an API. Using the URI is the most straightforward (and most commonly used as well) though it does violate the principle that a URI should refer to a unique resource. You are also guaranteed to break client integration when a version is updated. For these reasons, I like to use the `Accept` http header for versioning. 

>In rails, there is a good gem named Grape that ive used at jobs in the past that streamlines api development that includes native accept header support. However, if you aren't familiar with it, reading the code can have a learning curve. So, I'm opting to stick more firmly with rails-api and the MVC framework and chose to use the versionist gem for my versioning needs. ([bploetz/versionist: A plugin for versioning Rails based RESTful APIs.](https://github.com/bploetz/versionist))

