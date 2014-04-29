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
    
    if(params[:item][:name] != nil)
      @item.name = params[:item][:name]
      @item.description = params[:item][:description]
    end
    
    @item.quantity = params[:item][:quantity]
    @item.save
    
    if(params[:item][:name] != nil)
      flash[:success] = "You have successfully edited " + @item.name
    end
    
    redirect_to list_path(@list)
  end
end