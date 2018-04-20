require 'pry'


class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    binding.pry
    if req.path.match(/items/)
      item_name = req.path.split("/")[-1]
      @@items.each do |item|
        if item.name == item_name
          resp.write item.price
        end
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
