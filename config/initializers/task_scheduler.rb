 if !defined?(Rails::Console)

	 require 'rufus/scheduler'
	 require 'net/http'
	 scheduler = Rufus::Scheduler.start_new

	def puts_argvs
		 ARGV.each do|a|
		  puts "Argument: #{a}"
		end
	end

	#puts_argvs

	 scheduler.every '10s' do

	      puts "tick - 10s"

	      #puts_argvs 

	      #Net::HTTP.get('localhost','/jobs#tick')
	      #do something here
	      Net::HTTP.start("127.0.0.1", 3000) { |http| http.get('/jobs/tick') }

	 end


end


=begin

 scheduler.every '10m' do
   require "net/http"
   require "uri"
   url = 'http://codeglot.com'
   Net::HTTP.get_response(URI.parse(url))
end

=end