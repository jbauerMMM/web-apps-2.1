class PostsController < ApplicationController

  def index
    # find all Post rows
    @posts = Post.all
    # render posts/index view
    render({ :template => "posts/index" })
  end

  # def new
  #   # render posts/new view, the form for a new Post
  # end

  # def create
  #   # start with a new Post
  #   # assign the form's values to the Post's columns
  #   # save the Post row
  #   # redirect the user
  # end

end
