# sinatra_gambling_website
# sinatra_gambling_website

## Platform: 
Ubuntu 20.04.5
## Ruby version: 
2.7.0
# Introduction
In this assignment, use Sinatra web development framework to implement a simple bet web
application.

When user come to the gambling site, user is presented with a welcome view.
Then user will have two options: logon, or sign up.
logon option will present a login view.

The login/password information are in a database table as plain text.
(this table is initialized by "sign on" option)

If user is logged in, user is presented with a view for betting (just like the example in class
except user use a form to submit bet information)

Text showing whether the user has won or lost is displayed.
Also in this view, there are two sets of data:

One set is on the right. These are total values during this logon session
these values are 0 after login, and will be saved in session hash,

Another set is on the bottom. These are total values for this user since the beginning of the
betting on this site.

# Deployment
Heroku: https://assign3coen278.herokuapp.com/
