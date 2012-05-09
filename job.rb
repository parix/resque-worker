class Job < Resque::Plugins::RestrictionJob
  @queue = ENV["QUEUE"].split(",")

  def self.perform(args)
  end
end
