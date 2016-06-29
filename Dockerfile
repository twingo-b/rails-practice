FROM twingo2b/phantomjs-japanese-ruby:2.3.1
ENV LANG C.UTF-8

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install -j4

COPY . /usr/src/app

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
