class Job
  @queue = ENV["QUEUE"].split(",")

  def self.perform(args)
  end
end
