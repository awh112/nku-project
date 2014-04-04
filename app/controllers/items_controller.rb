class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(params[:item].permit(:name, :description, :quantity))
    redirect_to list_path(@list)
  end
end