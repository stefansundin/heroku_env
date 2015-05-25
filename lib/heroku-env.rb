module HerokuEnv
  module_function
  def run
    # Redis
    ENV["REDIS_URL"] ||= ENV["REDISCLOUD_URL"] || ENV["REDISTOGO_URL"]

    # Memcache
    ENV["MEMCACHE_SERVERS"] ||= ENV["MEMCACHIER_SERVERS"] || ENV["MEMCACHEDCLOUD_SERVERS"]
    ENV["MEMCACHE_USERNAME"] ||= ENV["MEMCACHIER_USERNAME"] || ENV["MEMCACHEDCLOUD_USERNAME"]
    ENV["MEMCACHE_PASSWORD"] ||= ENV["MEMCACHIER_PASSWORD"] || ENV["MEMCACHEDCLOUD_PASSWORD"]

    # Mongo
    ENV["MONGO_URL"] ||= ENV["MONGOLAB_URI"] || ENV["MONGOSOUP_URL"]

    # MySQL
    ENV["MYSQL_URL"] ||= ENV["CLEARDB_DATABASE_URL"]

    # Neo4j
    ENV["NEO4J_URL"] ||= ENV["GRAPHSTORY_URL"] || ENV["GRAPHENEDB_URL"]

    # Elasticsearch
    ENV["ELASTICSEARCH_URL"] ||= ENV["BONSAI_URL"] || ENV["SEARCHBOX_SSL_URL"]

    # SMTP
    ENV["MANDRILL_SMTP_SERVER"] ||= "smtp.mandrillapp.com" if ENV["MANDRILL_USERNAME"]
    ENV["SENDGRID_SMTP_SERVER"] ||= "smtp.sendgrid.net" if ENV["SENDGRID_USERNAME"]

    ENV["SMTP_HOST"] ||= ENV["MANDRILL_SMTP_SERVER"] || ENV["SENDGRID_SMTP_SERVER"] || ENV["MAILGUN_SMTP_SERVER"] || ENV["POSTMARK_SMTP_SERVER"]
    ENV["SMTP_PORT"] ||= ENV["MAILGUN_SMTP_PORT"] || "587"
    ENV["SMTP_USERNAME"] ||= ENV["MANDRILL_USERNAME"] || ENV["SENDGRID_USERNAME"] || ENV["MAILGUN_SMTP_LOGIN"] || ENV["POSTMARK_API_KEY"]
    ENV["SMTP_PASSWORD"] ||= ENV["MANDRILL_APIKEY"] || ENV["SENDGRID_PASSWORD"] || ENV["MAILGUN_SMTP_PASSWORD"] || ENV["POSTMARK_API_KEY"]

    # If you use Postmark, you need to configure MAIL_FROM manually
    ENV["MAIL_FROM"] ||= ENV["MANDRILL_USERNAME"] || ENV["SENDGRID_USERNAME"] || ENV["MAILGUN_SMTP_LOGIN"]

    # Airbrake
    ENV["RAYGUN_HOST"] ||= "api.raygun.io" if ENV["RAYGUN_APIKEY"]
    ENV["ROLLBAR_HOST"] ||= "api.rollbar.com" if ENV["ROLLBAR_ACCESS_TOKEN"]
    ENV["APPENLIGHT_HOST"] ||= "api.appenlight.com" if ENV["APPENLIGHT_APIKEY"]

    ENV["AIRBRAKE_HOST"] ||= ENV["RAYGUN_HOST"] || ENV["ROLLBAR_HOST"] || ENV["APPENLIGHT_HOST"]
    ENV["AIRBRAKE_KEY"] ||= ENV["RAYGUN_APIKEY"] || ENV["ROLLBAR_ACCESS_TOKEN"] || ENV["APPENLIGHT_APIKEY"]
  end
end

require "heroku-env/railtie" if defined?(Rails)

HerokuEnv.run
