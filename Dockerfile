FROM jekyll/jekyll:4.1.0

RUN mkdir -p /var/www/html
VOLUME /var/www/html
WORKDIR /var/www/html

COPY Gemfile* ./
RUN bundle install

CMD bundle exec jekyll serve --host 0.0.0.0 --port 8000 --incremental

EXPOSE 8000

