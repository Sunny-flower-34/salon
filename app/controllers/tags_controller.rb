class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    # @users = User.all
   
      @users = User.tagged_with("#{params[:tag_name]}")
   

  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    # @products = Product.tagged_with(@tag.name)
  end
end
