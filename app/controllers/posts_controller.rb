class PostsController < ApplicationController
  # this one shows all the blog posts
  def index
  end
  # this will show a post based on the ID of the post, which will be passed in the URL, for example: /posts/(insert ID here)
  def show
    @post = Post.find(params[:postid])
  end
  # the actual form/page to create a new blog post
  def new
    @post = Post.new
  end
  #  this page will not be visible to the user, but it will be used to create a new blog post in the database
  #  rail will create a new blog after hitting the submit button on the new blog post form/page
  def create
    # lets save the data to the post in the database
    # one done lets sent the user to the show page of the newly created blog post
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path(@post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end
  # this one shows the form/page to edit a blog post
  def edit
  end
  # you dont see this page, but it will be used to update the blog post in the database after hitting the submit button on the edit blog post form/page
  def update
    # lets save the data to the post in the database
    # one done lets sent the user to the show page of the newly created blog post
  end
  # DO NOT SHOW THIS PAGE, this is the page that will be used to delete a blog post from the database after hitting the delete button somewhere on the show page of the blog post
  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
