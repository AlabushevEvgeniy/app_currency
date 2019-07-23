desc "This task updates official rate and reload page"
task :update_rate => :environment do
  official_rate = OfficialRate.update_rate
  OfficialRate.create!(value: official_rate)
end
