# PlanningPoker

Simple planning poker application for trying out Phoenix LiveView

[![CI](https://github.com/lucazulian/planning_poker/actions/workflows/ci.yml/badge.svg)](https://github.com/lucazulian/planning_poker/actions/workflows/ci.yml)


## About the Application

TODO


## How it works

TODO


## Requirements

Build and run project on your bare machine:

  - Erlang/OTP **25+**
  - elixir **1.14+**
  
or using docker-compose:

  - docker **20+**
  - docker-compose **1.29+**
  - GNU make **4+**


## Getting started
 
### Local environment

In your local environment it needs to install all **Requirements** beforehand.

#### Setup the application

```bash
mix setup
```

#### Start the application

```bash
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


### Docker Compose

Docker Compose is used to simplify development and configuration.
Makefile is used as a wrapper around docker-compose commands.
Some commands are aliases around mix aliases, just to avoid boring and repetitive commands. 

#### Make commands

```bash
build                          Build all containers
delete                         Delete all containers, images and volumes
halt                           Shoutdown all containers
setup                          Setup application
shell                          Enter into game container
start                          Start application
up                             Start all containers
watch                          Watch tests
```

#### Setup application

```bash
make setup
```

#### Start application

```bash
make start
```

#### Destroy environment

```bash
make delete
```
