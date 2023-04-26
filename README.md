# News App
This application fetches data from third-party `News APIs` (https://newsapi.org) and displays all the news in a list. Users can sign up or log in to save news articles to their favorites.

## Table of Contents

- [News App](#news-app)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Initialization](#initialization)
  - [Setup](#setup)
    - [Docker environment](#docker-environment)
    - [Local environment](#local-environment)

## Requirements

- Docker 19.x
- [Get API KEY from news API](https://newsapi.org)

If you run the project locally, the followings are required.

* Ruby 3.1.0
* Bundler 2.3.x
* MySQL 8.0.x

## Initialization

After exporting project from iCode, initialize the project. First, create your development environment.

```bash
# docker env
docker-compose build

# local env
bundle install
```


```
# docker env
docker-compose run web ruby ./bin/initialize

# local env
ruby ./bin/initialize
```

It's all steps to initialize the project. When you finish initialization, please remove this ` ## Initialization ` section from the readme.

## Setup

Setup procedure of development environment.

### Docker environment

Build docker containers

```bash
docker-compose build
```

Setup database

```bash
docker-compose run web bundle exec rake db:create db:migrate db:seed
```

Start the app

```bash
docker-compose up
```

### Local environment

Install dependencies

```bash
## Install gems
bundle install
```

Start mysql and setup database

```bash
bin/rake db:create db:migrate db:seed
```

Start the app

```bash
## API server
bin/rails s
```

Start console

```bash
bin/rails c
```
