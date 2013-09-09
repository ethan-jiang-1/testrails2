class JobsController < InheritedResources::Base
	def tick
		name = " new job created @ " + Time.now.to_s 
		Job.create!( name: name,  details: "blah, blah...")

		redirect_to jobs_path
	end 
end
