# Scaffold for social media app with Ruby on Rails

We build a social media app called “Stay in touch”.

As a guest user:

- I want to be able to create account/log in.
- I can see only “Sign in” and “Sign out” page.

As a logged-in user:

- I want to be able to see all users list.
- I want to be able to see selected user page with their user name and all posts written by them (the most recent posts on the top).
- I want to be able to send a friendship invitation.
- I want to see a button “Invite to friendship” next to the name of user who is not my friend yet - on both users’ list and single user page.
- I want to be able to see pending friendship invitations sent to me from other users.
- I want to be able to accept or reject friendships invitation.
- I want to be able to create new posts (text only).
- I want to be able to like/dislike posts (but I can like single post only once).
- I want to be able to add comments to posts.
- Timeline page should be the root page of the app.

![image](https://i.imgur.com/gs2iWtY.png)

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo
[Hosted on Heroku](https://social-microverse.herokuapp.com/)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

### Deployment

+ Open terminal on your workspace with
```
cd /home/projects_workspace/..
```
+ Cloning the project input the next code:
```
git clone https://github.com/rubenpazch/ror-social-scaffold.git
```
+ Navigate to the folder of the project
```
cd /ror-social-scaffold/
```
Migrate the database
```
rails db:migrate
```
Populating with data
```
rake db:setup
```
Run the server
```
rails server
```

## Authors

👤 **Ruben Paz Chuspe**

- Github: [@rubenpazch](https://github.com/rubenpazch)
- Linkedin: [rubenpch](https://www.linkedin.com/in/rubenpch/)

👤 **Isaac Gonzalez**

- Github: [@idgm5](https://github.com/idgm5)
- Twitter: [@idgm5](https://twitter.com/idgm5)
- Linkedin: [Isaac Gonzalez](https://www.linkedin.com/in/isaacmunguia)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgements

+ [Github](http://github.com/).
+ [The Odin Project](theodinproject.com/).

## License

This project is [MIT](lic.url) licensed.
