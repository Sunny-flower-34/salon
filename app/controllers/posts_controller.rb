class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # redirect_back(fallback_location:  root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
      redirect_to post_path(@post), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def index 
      @posts = Post.all
    end
    
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
      @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得

  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path, alert: "不正なアクセスです"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '更新しました'
    else
      render :edit
    end
    
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path(@post)
  end


    private
  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end

end
