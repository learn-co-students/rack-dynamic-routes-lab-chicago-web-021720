class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      #resp.write(req.params["items"])
      data = req.path.split("/items/").last
      fit = @@items.find { |it| it.name == data}
      if fit
        resp.write fit.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
      #return the price of items parameter
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
