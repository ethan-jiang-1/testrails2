require 'rake'
require 'stringio'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
TestRails2::Application.load_tasks #

class RailsRakeController < ApplicationController
  #layout "application_light"

  rescue_from Exception, :with => :handle_exceptions

  def run
    @rake_task = nil
    @rake_task_name = nil
    if !params[:task].nil?
      @rake_task_name = params[:task].to_s
      @rake_task = execute_rake_task_ex @rake_task_name
    end
  end

private
  def handle_exceptions(e)
    #p e

    msg = "<h3> Rake Run </h3>"
    msg += "<p> Error on run Rake command: <b> rake " + params[:task] + "</b></p>"
    msg += "<pre>" + e.message.to_s + "</pre>"
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

  def execute_rake_task_ex task_name
    t = Rake.application[task_name]

    t.reenable
    @rake_stdout_lines, @rake_stderr_lines = capture_stdout { t.invoke }

    t
  end

end

module Kernel

  def capture_stdout
    out = StringIO.new
    err = StringIO.new
    $stdout = out
    $stderr = err
    yield
    return out,err
  ensure
    $stdout = STDOUT
    $stderr = STDERR
  end

end
