require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        # cont = Object.const_get('HomeController')
        # controller = cont.new(env)
        # text = controller.send('index')
        # return [200, {'Content-Type' => 'text/html'}, [text]]

        res = Rack::Response.new
        res.redirect('/home/index', 302)
        return res
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
        response = 200
      rescue Exception => e
        text = "<h1>THERE WAS AN ERROR, DO NOT PANIC</h1>"
        text << "<h2>Message</h2><p>#{e.message}</p>"
        text << "<h2>Backtrace</h2><p>#{e.backtrace.inspect}</p>"
        response = 500
      end

      [response, {'Content-Type' => 'text/html'}, [text]]
    end
  end
end
