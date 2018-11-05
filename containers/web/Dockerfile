FROM ruby:2.5.3
RUN apt-get update
RUN apt-get install -y --no-install-recommends --allow-unauthenticated \
        build-essential \
        libpq-dev \
        mysql-client
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN useradd -m app
RUN chown -R app:app /app