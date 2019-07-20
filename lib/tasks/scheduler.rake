desc "This task is called by the Heroku scheduler add-on"
task :update_course => :environment do
  puts "Официальный курс на сегодня:"
  CourseEntry.update_course
  puts "done."
end
