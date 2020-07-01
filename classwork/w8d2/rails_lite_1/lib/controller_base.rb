require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'


class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise if @already_built_response
    @res.set_header('Location', url)
    @res.status = 302
    @already_built_response = true
    @res
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise if @already_built_response
    @res.set_header('Content-Type', content_type)
    @res.write(content) 
    @already_built_response = true
    @res
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.to_s.underscore
    path_to_controller = File.dirname(__FILE__)
    # dir_above_controller = path_to_controller[0..]
    path_and_file =  File.join( , "views", controller_name, template_name.to_s)
    read_template = File.read(path_and_file)
    binding_template = ERB.new(read_template).result(binding)
    render_content(binding_template, "text/html")
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

