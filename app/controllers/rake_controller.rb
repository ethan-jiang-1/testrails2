require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
TestRails2::Application.load_tasks #

class RakeController < ApplicationController

  rescue_from Exception, :with => :handle_exceptions

  def run
    @rake_task = nil
    @rake_task_name = nil
    if !params[:task].nil?
      @rake_task_name = params[:task].to_s
      @rake_task = execute_rake_task @rake_task_name
    end
  end

private
  def handle_exceptions(e)
    #p e

    msg = "<h3> Error on run Rake command <h3>"
    msg += "<h4> <pre>" + e.message.to_s + "</pre> </h4>"
    render :inline => msg, :layout => 'application'
  end

  def execute_rake_task task_name
    t = Rake::Task[task_name]

    #p t.inspect
    #p t.name

    if Rake::Task.task_defined? task_name
      t.execute()
      t.invoke()
    end
    t
  end

end
