# rails-practice

[![Code Climate](https://codeclimate.com/github/twingo-b/rails-practice/badges/gpa.svg)](https://codeclimate.com/github/twingo-b/rails-practice) [![Test Coverage](https://codeclimate.com/github/twingo-b/rails-practice/badges/coverage.svg)](https://codeclimate.com/github/twingo-b/rails-practice/coverage) [![wercker status](https://app.wercker.com/status/4b21481ab2c04b61ed9e05258d6e709e/s "wercker status")](https://app.wercker.com/project/bykey/4b21481ab2c04b61ed9e05258d6e709e)

# 開発環境
## 前提条件
- Macでうごかしてます
    - [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
    - [Getting Started with Docker for Mac](https://beta.docker.com/docs/mac/getting-started/)
- バージョン

```bash
% docker --version
Docker version 1.11.1, build 5604cbe

% docker-compose --version
docker-compose version 1.7.1, build 0a9ab35

# Docker for Mac
# Version 1.11.1-beta14 (build: 8670)
```

## rails
```bash
# clone
% git clone git@github.com:twingo-b/rails-practice.git && cd rails-practice

# setup & start
% docker-compose build
% docker-compose up -d
% docker-compose run rails ./bin/rake db:create
% docker-compose run rails ./bin/rake db:migrate

# see:
# rails: http://localhost:3000
# mailcatcher: http://localhost:1080/

# rspec
% docker-compose run rails ./bin/rspec

# stop
% docker-compose stop
```

## codeclimate
```bash
# install
% brew tap codeclimate/formulae
% brew install codeclimate
# execute
% codeclimate analyze
```

## wercker ci
```bash
# install
% brew tap wercker/wercker
% brew install wercker-cli
# execute
% wercker check-config --docker-host unix:///var/run/docker.sock
% wercker --environment wercker.env b --docker-host unix:///var/run/docker.sock
```

# heroku
```bash
# install
% brew install heroku-toolbelt

# settings for mysql
% heroku addons:create cleardb:ignite
% heroku config:set DATABASE_URL='mysql2://[user]:[pass]@[host].cleardb.net/[db]?reconnect=true&encoding=utf8mb4&collation=utf8mb4_general_ci'
# recreate database for utf8mb4
% heroku run rake db:migrate:reset

# settings for sendgrid
% heroku addons:add sendgrid:starter
% heroku config:set APP_HOSTNAME='[app name].herokuapp.com'
% heroku config:set MAIL_FROM='xxx@gmail.com'
% heroku config:set MAIL_TO='xxx@gmail.com'
```

# deploy
- wercker経由、origin/masterにmergeされた際に、herokuにdeployされます