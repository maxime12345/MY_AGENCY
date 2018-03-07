namespace :db do
  desc "Dumps the database to db/APP_NAME.dump"
  task :dump => :environment do
    cmd = "pg_dump --clean --no-owner --no-acl --format=c #{db} > #{Rails.root}/db/#{app}.dump"

    puts "Dumping database"
    system(cmd)
    puts "Database dumped to #{app}/db/#{app}.dump"
  end

  desc "Restores the database dump at db/APP_NAME.dump."
  task :restore => :environment do
    cmd = "pg_restore --clean --no-owner --no-acl --dbname #{db} #{Rails.root}/db/#{app}.dump"

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
