namespace :db do
  desc "Recreate database: db:drop, db:create, db:migrate, db:seed"
  task recreate: :environment do
    list_tasks = case
    when Rails.env.development?
      %w[db:drop db:create db:migrate db:seed db:test:prepare]
    when Rails.env.staging?
      %w[db:drop db:create db:migrate db:seed]
    else
      Array.new
    end
    if list_tasks.any?
      list_tasks.each do |task|
        puts "\e[36mEXECUTE #{task} COMMAND\e[0m"
        Rake::Task[task].invoke
      end
    else
      puts "\e[31mdb:recreate task can be executed only in the development environment.\e[0m"
    end
  end

  desc "Truncate all tables except schema_migrations"
  task truncate: :environment do
    tables = ActiveRecord::Base.connection.tables - ["schema_migrations"]
    puts "Truncating tables..."
    tables.each do |table|
      begin
        ActiveRecord::Base.connection.execute "DELETE FROM #{table}"
        print "."
      rescue => e
        puts "Truncate #{table} failed"
        puts "#{e.class}: #{e.message}"
      end
    end
    puts " [ \e[0;32m OK \e[0m ]"
  end
end
