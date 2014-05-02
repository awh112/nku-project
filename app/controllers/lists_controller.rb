class ListsController < ApplicationController
  def new
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list
  end
  
  def index
    low_items = Item.where("quantity < ?", 5)
    low_ids = low_items.select(:list_id).distinct
    
    
    low_lists = "";
    low_ids.each do |low_id|
      if(low_id != nil)
        if(List.find_by_id(low_id.list_id) != nil)
          low_lists << List.find(low_id.list_id).title
          low_lists << ", "
        end
      end
    end
    low_lists.chomp(", ")
    
    if(low_lists != "")
      flash[:success] = "You may be low on items in the following lists: " + low_lists.chomp(", ")
    end
    
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    
    if @list.update(params[:list].permit(:title, :description))
      flash[:success] = "You have successfully edited " + @list.title
      redirect_to lists_path      
    else
      render 'edit'
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    
    redirect_to lists_path
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :description)
  end
end