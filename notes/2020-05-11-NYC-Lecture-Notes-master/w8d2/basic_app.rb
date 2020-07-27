require 'rack'
require 'byebug'
require 'json'

# Most Basic App 
<<<<<<< HEAD
    
=======
# most_basic_app = Proc.new do
  # three element array: status, headers (as a hash), and body (as an array with a string inside).
#   ['200', {'Content-Type' => 'text/html'}, ['This is the most basic rack app.']]
# end
    
# Rack::Server.start({app: most_basic_app, Port: 3000})
  # `most_basic_app` will be invoked with .call
>>>>>>> 1069e74d15471bc909f82066607b29a6bca50b4d



# Most basic redirect app 
 # most_basic_redirect_app = Proc.new do
       # three element array: status (integer or string), headers (as a hash), and body (as an array with a string inside).
 #       [302, {'Content-Type' => 'text/html', 'Location' => 'https://www.google.com'}, []]
 # end
    
 # Rack::Server.start({app: most_basic_redirect_app, Port: 3000})



# Less Basic App - use Rack for response object 
# less_basic_app = Proc.new do
#   res = Rack::Response.new # creating a new rack response object
#   res.set_header('Content-Type', 'text/html') # `set_header`, `write`, `finsih` are rack res object methods
#   res.write('Baby steps towards a full app!') # use .write(appends to the body) rather than body=(this will overwrite anything already there)
#   # .finish turns our response into that three element array we mentioned earlier.
#   res.finish
# end

# Rack::Server.start(
#   app: less_basic_app,
#   Port: 3000
# )
 # Rack::Server.start -> start listening on port (3000 here) and call `.call` on whatever app is passed in (less_basic_app here)



# Cookie party app! - Use the request and the response rack obj.
# cookie_party_app = Proc.new do |env|
#     # debugger
#     req = Rack::Request.new(env)
#     res = Rack::Response.new
#     res.write("<h1>COOKIE PARTY</h1>")
#     if req.cookies["cookie_party"] # do we have this cookie in our req obj?
#       res.write("<h2>We have cookies for our party!</h2>")
#     else
#       res.write("<h2>Aw, there's no cookies! Refresh to make some.</h2>")
#       res.set_cookie("cookie_party", { value: true }) # assign cookie within response
#     end
#     # debugger 
#     res.finish
# end
  
# Rack::Server.start(
#     app: cookie_party_app,
#     Port: 3000
# )



# Least basic app! 
class FunApp
    def self.call(env)
        req = Rack::Request.new(env)
        res = Rack::Response.new
        res.status = '200'
        res['Content-Type'] = 'text/html'
        if req.path == '/cat'
          res.write('<img style="height:500px;"src="https://i.redditmedia.com/4f_mapV0HWpmmB_O9gL6oN7didYlC5JfGyp2Z2KEGc8.jpg?s=e2574cde5cae90a3ceaca4a9ea2c3e6b"/>')
        elsif req.path == '/dog'
          res.write('<img src="https://i.redditmedia.com/mQr8eM7ENWOkqxIDm0vKW1YZ7rFevnuB4J1nJbFUyMI.jpg?s=62ad4532bc465a06f42fac795e7d1090"/>')
        elsif req.path == '/worldcup'
          res.write('<img src="https://i.imgur.com/2f70c7e.gif"/>')
        else
          res.status = '404'
          res.write("404!")
        end
        res.finish
    end
end
    
Rack::Server.start(
    app: FunApp,
    Port: 3000
)

