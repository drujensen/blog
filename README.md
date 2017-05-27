# Blog using Crystal and Kemalyst

[![Build Status](https://travis-ci.org/kemalyst/blog-kemalyst.svg?branch=master)](https://travis-ci.org/kemalyst/blog-kemalyst)

This is a sample application that shows how to build a crud application.  This
also provides an example of securing specific pages and leveraging the session
to maintain authorization.

## Installation

Create a mysql database called `blog` and configure the `config/database.yml`
to provide the credentials to access the table.
Then:
```
shards update
kgen migrate up
```

## Usage

To run the demo:
```
crystal build src/blog.cr
./blog
```
username: admin
password: password

## Docker and Docker Compose

This will start an instance of mysql, migrate the database, run the specs,
and launch the site at http://localhost:3000
```
docker-compose up
```
Note: The Docker image is compatible with Heroku.  

## Contributing

1. Fork it ( https://github.com/[your-github-name]/your_project/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors


- [[drujensen]](https://github.com/[drujensen]) dru.jensen - creator, maintainer
