# bundler
require "rubygems"
require "bundler"
begin
  Bundler.require(:default)
rescue Bundler::GemNotFound => e
  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end

# environment
environment = ENV["ENV"] || "development"
ENV["ROOT"] = Dir.pwd

# redis
redis_config = YAML.load(File.open(Dir.pwd + "/config/redis.yml"))[environment]
Resque.redis = redis_config

# activerecord
database_config = YAML.load(File.open(Dir.pwd + "/config/database.yml"))[environment]
ActiveRecord::Base.establish_connection(database_config)

# models
Dir[Dir.pwd + "/models/**/*.rb"].each {|file| require file }

# job
require "job"
