require "erubis"

module Rulers
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore klass
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name,
                           "#{view_name}.html.erb")
      template = File.read filename
      context = view_assigns
      eruby = Erubis::Eruby.new(template)
      eruby.evaluate(context)
    end
    
    def view_assigns
      variables = instance_variables
      variables.each_with_object({}) { |name, hash|
        hash[name[1..-1]] = instance_variable_get(name)
      }
    end
  end
end
