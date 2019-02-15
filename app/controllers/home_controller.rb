require 'mailgun'

class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  def create
    @post = Post.new
    @post.title = params[:title]
    @post.email = params[:email]
    @post.content = params[:content]
    @post.date = params[:date]
    @post.save
    
    @title = params[:title]
    @email = params[:email]
    @content = params[:content]
    
    mg_client = Mailgun::Client.new("key-65c42356d14908688037b0159d79fd84")

    message_params =  {
                   from: 'lalucesolare@likelion.org',
                   to:   @email,
                   subject: @title,
                   text:    @content
                  }

    result = mg_client.send_message('sandboxe894697cfcb548f8895a0fcb0f834ecb.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
    
    redirect_to '/'
  end
  def write
  end
  def delete
    @post = Post.find(params[:post_id])
    @post.destroy
    
    redirect_to '/'
  end
  def edit
    @post = Post.find(params[:post_id])
  end
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:title]
    @post.email = params[:email]
    @post.content = params[:content]
    @post.date = params[:date]
    @post.save
    
    @title = params[:title]
    @email = params[:email]
    @content = params[:content]
    
    mg_client = Mailgun::Client.new("key-65c42356d14908688037b0159d79fd84")

    message_params =  {
                   from: 'lalucesolare@likelion.org',
                   to:   @email,
                   subject: @title,
                   text:    @content
                  }

    result = mg_client.send_message('sandboxe894697cfcb548f8895a0fcb0f834ecb.mailgun.org', message_params).to_h!

    message_id = result['id']
    message = result['message']
    
    redirect_to '/'
  end
end
