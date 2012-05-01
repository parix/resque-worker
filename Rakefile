$LOAD_PATH.unshift File.dirname(__FILE__) + '/../../lib'
$LOAD_PATH.unshift File.dirname(__FILE__) + '/'
require 'init'

namespace :resque do
  task :stop_workers do
    pids = []
    queues = ["job"]

    Resque.workers.each do |worker|
      queues.each do |queue|
        pids << worker.to_s.split(/:/).second if worker.queues.find_all{|p| p =~ /#{queue}/}.length > 0
      end
    end

    if pids.size > 0
      system("kill -QUIT #{pids.join(' ')}")
    end
    system ("rm /var/run/god/job.pid")
  end
end
