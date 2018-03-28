class PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = Post.limit(params[:count].to_i) if params[:count]
  end

  def show
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      tables: true
    )
    @post = Post.find(params[:id])
    @content = markdown.render(@post.content)
  end
end
