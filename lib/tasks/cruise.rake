require 'spec/rake/spectask'
require 'spec/rake/verify_rcov'
RCov::VerifyTask.new(:verify_rcov) { |t| t.threshold = 100.0 }

desc "Task for cruise Control"
task :cruise do
  RAILS_ENV = ENV['RAILS_ENV'] = 'test' # Without this, it will drop your production database.
  CruiseControl::invoke_rake_task 'db:reset'
  CruiseControl::invoke_rake_task 'cruise_coverage'
  CruiseControl::invoke_rake_task 'verify_rcov' 
end

desc "Run specs and rcov"
Spec::Rake::SpecTask.new(:cruise_coverage) do |t|
  t.spec_opts = ['--options', "#{RAILS_ROOT}/spec/spec_rcov.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec,/usr/lib/ruby', '--rails', '--text-report']
end

