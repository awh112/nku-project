class ListsController < ApplicationController
  def new
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list
  end
  
  def index
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