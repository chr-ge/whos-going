<img src="/app/assets/images/logo.png?raw=true" alt="drawing" width="125" align="right" />

# who's going
![CircleCI](https://img.shields.io/circleci/build/github/chr-ge/whos-going?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Website](https://img.shields.io/website?down_color=lightgrey&down_message=offline&style=flat-square&up_color=green&up_message=online&url=https%3A%2F%2Fwho-s-going.herokuapp.com%2F)

## **Live Staging Site**
- https://who-s-going.herokuapp.com/

## Ruby version
- 2.7.1

## Configuration
- Install PostgreSQL
- Configure database.yml file
- `bundle install`
- `yarn install`

## Database creation
- `rails db:create`
- `rails db:migrate`

## How to run the test suite
- Run Specs with `rspec`

## Deployment instructions
- Continuous Integration w/ CircleCi + Heroku
- Deployment to Heroku staging done automatically when a PR is merged to master. 
