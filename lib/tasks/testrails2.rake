namespace :testrails2 do

  desc "testrails 2 initializer"
  task :initializer do
      puts "[TestRails2] TestRails2 initialization in testrails2.rake get called"
  end

end

task :environment => 'testrails2:initializer'
