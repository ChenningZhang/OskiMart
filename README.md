# OskiMart

## Overview
Our OskiMart software is intended to be a more user friendly version of the facebook group “Free and For Sale” for Berkeley students. Each customer will have his/her own profile, through which they can log in and buy or sell products. The customer can write a short description of the product, input the cost and upload images or videos of the product. Our software will categorize products into five categories which includes technology, furniture, clothes, services, and books. The software will have a search engine that should help students find older posts easily, and students are also able to comment on posts of products that they like and on their own posts. If customers wish to communicate privately with other sellers they will also have the option of messaging privately.

## How to run app
To run it locally, simply clone the repo, cd to the app folder, run 'rails s' in terminal and go to localhost:3000 in browser.
Our app is also deployed on Heroku: oskimart.herokuapp.com

## Features implemented
	* User sign up and login (Devise)
	* Create, Update, show and destroy a post.
	* Filter posts by price ($, $$, $$$)
	* Filter posts by Category ('Books', 'Technology', 'Service', 'Furniture', 'Other')
	* Search by keywords
	* Favorite a post
	* Comment a post
	* Messager
	* Review a user
	* Close a post
	* Payment via Venmo

## How to run tests
Our tests are located in the spec folder. To run all tests, simply run 'rake spec'. To run specific test or tests in specific folder, run 'bundle exec rspec spec/controllers' for example.
