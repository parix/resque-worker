class Job < Resque::Plugins::RestrictionJob
  @queue = :job

  def self.perform(args)
  end
end
