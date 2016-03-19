require "csv"
namespace :master_data do
  desc "Create master data Nation"
  task create_nation: :environment do
    ActiveRecord::Base.transaction do
      puts "-- Clear master data for Nation --"
      M::Nation.with_deleted.delete_all
      create_master_data "nation"
    end
  end

  desc "Create master data Phase"
  task create_phase: :environment do
    ActiveRecord::Base.transaction do
      puts "-- Clear master data for Phase --"
      M::Phase.with_deleted.delete_all
      create_master_data "phase"
    end
  end

  desc "Create master data User"
  task create_user: :environment do
    ActiveRecord::Base.transaction do
      puts "-- Clear master data for Admin --"
      M::User.with_deleted.delete_all
      create_master_data "user"
    end
  end

  desc "Reload maser data"
  task recreate_model: :environment do
    ActiveRecord::Base.transaction do
      puts "--- Clear master data for #{ENV['MODEL']} ---"
      "M::#{ENV['MODEL']}".safe_constantize.delete_all
      create_master_data ENV["MODEL"].underscore
    end
  end

  def create_master_data klass_name
    klass = "M::#{klass_name.classify}".safe_constantize
    puts "-- Creating master data for #{klass.name}"
    CSV.open("#{Rails.root}/db/masters/#{klass_name.to_s.pluralize}.csv",
      {headers: true, header_converters: :downcase}).each do |row|
      attrs = row.to_hash
      klass.create attrs
    end
  end
end
