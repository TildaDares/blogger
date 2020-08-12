class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]
  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    taggings = Tagging.find(params[:id])
    taggings.destroy
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Destroyed!"
    redirect_to tags_path
  end

  def index
    @tags = Tag.all
  end
end
