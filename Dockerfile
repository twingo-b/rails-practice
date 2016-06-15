FROM ruby:2.3
ENV LANG C.UTF-8

ENV PHANTOMJS_VERSION 2.1.1

RUN apt-get update && \
    apt-get install -y nodejs mysql-client fonts-ipaexfont-gothic --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /usr/src/app

RUN wget -qO /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
    && cd /tmp \
    && tar jxf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
    && mv phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 phantomjs-$PHANTOMJS_VERSION-linux-x86_64

WORKDIR /usr/src/app

RUN gem install bundler
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]

