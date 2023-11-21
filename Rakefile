# frozen_string_literal: true

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts 'Unable to load RuboCop.'
end

# Import external rake tasks
Dir.glob('tasks/**/*.rake').each { |r| import r }

desc 'Run report and email results'
task report_and_mail: %i[download_report mail]
