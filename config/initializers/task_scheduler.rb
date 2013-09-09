 if !defined?(Rails::Console)

	 require 'rufus/scheduler'
	 require 'net/http'
	 scheduler = Rufus::Scheduler.start_new



	port = Rails::Server.new.options[:Port]
	puts "HeartBeat: Rails Server port is : " + port.to_s


	 scheduler.every '300s' do

	      puts "HeartBeet: 5 mins (i.e 300s intervals) "

	      Net::HTTP.start("127.0.0.1", port) { |http| http.get('/jobs/tick') }

	 end


end


=begin

	def puts_argvs
		 ARGV.each do|a|
		  puts "Argument: #{a}"
		end
	end

 scheduler.every '10m' do
   require "net/http"
   require "uri"
   url = 'http://codeglot.com'
   Net::HTTP.get_response(URI.parse(url))
end

=end