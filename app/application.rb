require 'pry'


class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    binding.pry
    if req.path.match(/items/)
      @@items.each do |item|
        item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
