# frozen_string_literal: true
# ListsController provides CRUD operations for List objects.
class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    redirect_to lists_path, notice: 'List created successfully!'
    if @list.save
      redirect_to lists_path, notice: "List created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
