desc "This task updates official rate and reload page"
task :update_rate => :environment do
  OfficialRate.update_rate
  puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end
