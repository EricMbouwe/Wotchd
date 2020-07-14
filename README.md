# Wotchd - a mobile application which groups your hours spent on watching entertainement programs during the day, week or the month.

<img src="app/assets/images/wotchd-logo.png" alt="Wotchd" width="150" height="150">
This is the Capstone project for the Ruby on Rails Course

<hr />

<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/ericmbouwe/Wotchd">
    <img src="app/assets/images/microverse.png" alt="Microverse Logo" width="80" height="80">
  </a>
  
  <h3 align="center">Wotchd Application</h3>
  
  <p align="center">
    This project is part of the Microverse curriculum in Ruby On Rails course!
    <br />
    <a href="https://github.com/ericmbouwe/Wotchd"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="">View Demo</a>
    <a href="https://github.com/ericmbouwe/Wotchd/issues">Report Bug</a>
    <a href="https://github.com/ericmbouwe/Wotchd/issues">Request Feature</a>
  </p>
</p>
  
Wotchd is a tracker app.  
It is an application to group and track your hours spent on watching your favorite entertenement programs  
  
Additional features are :  
  - User can delete a program  
  - User can update a group and change its icon  

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Screen Shots](#application-screen-shots)
- [Video presentation](#video-presentation)
- [About the Project](#about-the-project)
- [N+1 Problem](#n+1-problem)
- [Entities Relationship Diagram](#erd)
- [Live Version](#live-version)
- [Application Instructions](#application-instructions)
- [System Requierments](#system-requierments)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [Development](#development)
- [Testing](#testing)
- [Populate DB](#populate-database)
- [Built With](#built-with)
- [Contributors](#contributors)
- [Copy Rights](#copyright)
- [Acknowledgements](#acknowledgements)

<hr />

## Application Screen Shots

#### Wotchd - splash screen

<img src="app/assets/images/Wotchd-home.png" alt="program interface">
<hr />

#### Sign Up

<img src="app/assets/images/sign-up.png" alt="program interface">
<hr />

#### Log In

<img src="app/assets/images/log-in.png" alt="program interface">
<hr />

#### Wotchd - User Home

<img src="app/assets/images/Wotchd-home.png" alt="program interface">
<hr />

#### Wotchd - My Programs

<img src="app/assets/images/Wotchd-home.png" alt="program interface">
<hr />

#### Wotchd - My shuffled Programs

<img src="app/assets/images/Wotchd-home.png" alt="program interface">
<hr />

#### Wotchd - All Groups

<img src="app/assets/images/Wotchd-home.png" alt="program interface">
<hr />

#### Wotchd - Group's Programs

<img src="app/assets/images/Wotchd-home.png" alt="program interface">
<hr />


## Video presentation

  [View with Loom](https://www.loom.com/share/)

<hr />

<!-- ABOUT THE PROJECT -->

## About The Project

The project creates a database which holds 3 tables:

    - Users : Is the table containing the users' data  
      - Fields :  
        - string:   name  
        - string:   email  
        - string:   password  
        - datetime: created_at  
        - datetime: update_at  

    - Programs : is the table containing the programs' data  
      - Fields:  
        - string:   name  
        - integer:  amount  
        - integer:  author_id  
        - integer:  group_id    
        - datetime: created_at  
        - datetime: update_at  

    - Groups : Is the table to groups programs  
      - Fields  
        - string: name  
        - string: icon  
        - datetime: created_at  
        - datetime: update_at  

We have 2 tables created by the ActiveStorage to store users and groups avtars as well.

  - active_storage_attachments
  - active_storage_blobs

<hr/>

## N+1 Problem

  The n+1 problem is encountered in this project in one case for the association between a user and programs and groups

  ```
    has_one :full_programs, -> { includes :group }, class_name: 'Program'
  ```

<hr/>

  #### Scope examples

```
  scope :no_group, -> { where group_id: nil }
  scope :order_by_name, -> { order('name DESC') }
```

<hr/>


## ERD

<img src="docs/wotchd-erd.png" alt="ERD">

<hr/>

<!-- ABOUT THE PROJECT -->
## Live version

You can see it working [![Heroku](https://pyheroku-badge.herokuapp.com/?app=blooming-meadow-82208)](https://Wotchd.herokuapp.com)

## Application Instructions


<hr/>

## System Requierments

- Ruby
- Rails
- Yarn
- RSpec
- ActiveStorage

## Dependencies

- gem 'rspec-rails'  
- gem 'capybara'  
- gem 'selenium-webdriver'  
- gem 'chromedriver-helper  
- gem 'bcrypt'  
- gem 'rack-cors'  

## Configuration

- first, clone the project
  Run

```
  git clone https://github.com/ericmbouwe/Wotchd.git
```

- Install the necessary dependancies
  Run

```
  rails active_storage:install
  rails db:migrate

  bundle install
  yarn install
```

<hr/>

## Development

- Clone the project

```
  https://github.com/ericmbouwe/Wotchd.git
```

<hr/>

## Testing
In order to run test run this command first

```
rails generate rspec:install
```
Then run  

```
rspec spec/
```
Unit and integration tests have been done using RSpec an Capybara
- Location /spec/tests/  
- 4 test files  
  - features_spec.rb  
  - user_spec.rb  
  - program_spec.rb  
  - group_spec.rb  

<hr/>

## Populate Database

To populate the database with sample data run :

```
  rails db:seed
```

<hr/>

## Built With

This project was built using these technologies.

- Ruby version 2.6
- Ruby On Rails version 6.0
- rspec
- capybara
- ActiveStorage
- Heroku

<hr/>

<!-- CONTACT -->

## Contributors

:bust_in_silhouette: **Author**

## Eric Mbouwe

- Github: [@ericmbouwe](https://github.com/ericmbouwe)
- Twitter: [@ericmbouwe](https://twitter.com/ericmbouwe)
- Linkedin: [Eric Mbouwe](https://www.linkedin.com/in/ericmbouwe)
- E-mail: ericmbouwe@gmail.com


<hr/>
<!-- ACKNOWLEDGEMENTS -->

## CopyRight

### Thanks to Gregoire Vella

 [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)  
 [And his ideas](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=), for the original design  

## Acknowledgements

- [Microverse](https://www.microverse.org/)
- [The Odin Project](https://www.theodinproject.com/)
- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
- [Gregoire Vella](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/ericmbouwe/Wotchd.svg?style=flat-square
[contributors-url]: https://github.com/ericmbouwe/Wotchd/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ericmbouwe/Wotchd.svg?style=flat-square
[forks-url]: https://github.com/ericmbouwe/Wotchd/network/members
[stars-shield]: https://img.shields.io/github/stars/ericmbouwe/Wotchd.svg?style=flat-square
[stars-url]: https://github.com/ericmbouwe/Wotchd/stargazers
[issues-shield]: https://img.shields.io/github/issues/ericmbouwe/Wotchd.svg?style=flat-square
[issues-url]: https://github.com/ericmbouwe/Wotchd/issues


