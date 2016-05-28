# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespace :db do
	
	task :places_mapping do 
		Places.create_mapping()	
	end

	task :seed do
		Rake::Task["db:places_mapping"].invoke
	end
end