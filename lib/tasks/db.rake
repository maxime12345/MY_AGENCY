namespace :db do
  desc "Dumps the database to db/APP_NAME.dump"
  task :dump => :environment do
    cmd = "pg_dump -Fc --clean --no-owner --no-acl --format=c #{db} > #{Rails.root}/public/#{app}.dump"

    puts "Dumping database"
    system(cmd)
    puts "Database dumped to #{app}/public/#{app}.dump"
  end

  desc "Restores the database dump at db/APP_NAME.dump."
  task :restore_development => :environment do
    cmd = "pg_restore --clean --no-owner --no-acl --dbname #{db} #{Rails.root}/public/#{app}.dump"

    puts "Restoring database"
    system(cmd)
    puts "Database restored"
  end

  desc "Restores the database dump at db/APP_NAME.dump."
  task :restore_production => :environment do
    cmd = "heroku pg:backups:restore '#{ENV['PRODUCTION_HOST']}/#{app}.dump' '#{ENV['DATABASE_KEY']}'"

    puts "Restoring database"
    system(cmd)
    puts "Database restored"
  end

  private

  def app
    Rails.application.class.parent_name.underscore
  end

  def db
    ActiveRecord::Base.connection_config[:database]
  end
end
