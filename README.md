# yaysunshineSuperDuperPassion
p 10 passion project

start by cloning Sinatra skeleton

As a user, I can log in with instagram
As a user, I can sign up to receive pandas to my phone
As a user, I can see a live instagram feed on the right of the page
As a user, I can see a big pic of the panda of the day with the date (and time -stretch-) above it
As a user, I can see a list of all my "liked" panda pics
As a user, I can post the panda of the day to my instagram -stretch?-
As a user, I can donate to a panda donation
As a user, I can contact the creator of the site

-stretch- As a user, I can have a profile picture

join table: user, likes, photos
class User has_many :photos :through :likes

![schema](/schema.jpg)



