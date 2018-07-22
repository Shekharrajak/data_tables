def say(msg, &block)
  print "#{msg}..."

  if block_given?
      yield
    puts " Done."
  end
end

namespace :data_tables do
  desc "Update datatables javascript and stylesheets dependent files"
  task :update => [:js, :css, :jquery]
  sh "mkdir -p lib/assets/javascripts/"
  sh "mkdir -p lib/assets/stylesheets/"
  task :js do
    say "Grabbing Core js from datatables codebase..." do
      sh "curl -# https://nightly.datatables.net/js/jquery.dataTables.js -L --compressed -o lib/assets/javascripts/jquery.dataTables.js"
    end
  end

  task :css do
    say "Grabbing css from the datatables website..." do
      sh "curl -# https://nightly.datatables.net/css/jquery.dataTables.css -L --compressed -o lib/assets/stylesheets/jquery.dataTables.css"
    end
  end

  task :jquery do
    say "Grabbing jquery from the jquery website..." do
      sh "curl -# http://code.jquery.com/jquery-latest.min.js -L --compressed -o lib/assets/javascripts/jquery-latest.min.js"
    end
  end
end
