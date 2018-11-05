Rake::Task['db:reset'].clear

namespace :db do
  task reset: :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['ridgepole:apply'].invoke
    Rake::Task['db:seed'].invoke
  end
end
