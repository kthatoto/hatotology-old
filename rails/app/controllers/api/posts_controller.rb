class Api::PostsController < ApplicationController
  protect_from_forgery except: [:create]
  def create
    if post = Post.find_by(id: params[:id].to_i)
      post.update(
        title: params[:title],
        content: params[:content]
      )
    else
      Post.create(
        id: params[:id].to_i,
        title: params[:title],
        content: params[:content]
      )
    end
    return render json: { status: 'success' }
  end
end
