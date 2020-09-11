class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    # @users = User.all
    if params[:tag_name]
      @users = User.tagged_with("#{params[:tag_name]}")
    else
      @users = User.all
    end

  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    # @products = Product.tagged_with(@tag.name)
  end
end
