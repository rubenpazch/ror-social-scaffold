# Scaffold for social media app with Ruby on Rails

> This repo includes intial code for social media app with basic styling. Its purpose is to be a starting point for Microverse students.

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

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.

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
