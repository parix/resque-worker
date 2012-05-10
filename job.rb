class Job
  @queue = ENV["QUEUE"].split(",")

  def self.perform(args)
    p "Hello World!\n"
  end
end
