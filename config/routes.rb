Rails.application.routes.draw do
  # get("/things", { :controller => "things", :action => "index" })

  get("/", { :controller => "home", :action => "index" })
  get("/data", { :controller => "data", :action => "show" })
  get("/tacos", { :controller => "tacos", :action => "index" })
  get("/dice", { :controller => "dice", :action => "index" })

  # One line, seven routes: index, show, new, create, edit, update, destroy.
  # The line below each is the long form of its index route, for comparison.
  resources("companies")
  # get("/companies", { :controller => "companies", :action => "index" })
  resources("contacts")
  # get("/contacts", { :controller => "contacts", :action => "index" })
  resources("posts")
  # get("/posts", { :controller => "posts", :action => "index" })
end
