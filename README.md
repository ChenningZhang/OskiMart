Our OskiMart software is intended to be a more user friendly version of the facebook group “Free and For Sale” for Berkeley students. Each customer will have his/her own profile, through which they can log in and buy or sell products. The customer can write a short description of the product, input the cost and upload images or videos of the product. Our software will categorize products into five categories which includes technology, furniture, clothes, services, and books. The software will have a search engine that should help students find older posts easily, and students are also able to comment on posts of products that they like and on their own posts. If customers wish to communicate privately with other sellers they will also have the option of messaging privately.

To run it locally, just open rails server and go to localhost:3000 in browser.
Our app is also deployed on Heroku: oskimart.herokuapp.com

Features implemented:
1. User sign up and login (Devise)
2. Create, Update, show and destroy a post.
3. Filter posts by price ($, $$, $$$)
4. Filter posts by Category ('Books', 'Technology', 'Service', 'Furniture', 'Other')
5. Search by keywords

Run the app in the following way:

1. Open rails server and go to localhost:3000 in browser
2. You will see the home page. 
	a) If this is your first time on the app, click on Sign Up (directly on the text). 
	b) If you already have an account, click on Log In (Directly on the text)
3. Input your user information and login/create account
4. You will be directed to index.html, which is the Newsfeed page (Most of the frontend is static right now, but will be dyanimc in the future)
5. You can see your exisitng posts
6. Click on Create Post to buy or sell something.
7. You will be directed to new.html. Input details for your post and click on Create post.
8. You will be taken back to index.html
9. You can filter by price by clicking on any of the buttons '$', '$$', '$$$'
10. You can select posts by a category (dropdown at the bottom of the newsfeed page). This dropdown will eventually be moved to the left sidebar.
11. You can see a post by clicking on the Show button next to each post
12. You can edit a post by clicking on the Update button next to each post
13. You can remove a post by clicking on the Remove button next to each post
