class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(params[:item].permit(:name, :description, :quantity))
    redirect_to list_path(@list)
  end
  
  def edit
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
  end
  
  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    
    @item.name = params[:item][:name]
    @item.description = params[:item][:description]
    @item.quantity = params[:item][:quantity]
    @item.save    
    
    flash[:success] = "You have successfully edited " + @item.name
    redirect_to list_path(@list)
  end
end