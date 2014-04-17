class ShoppingsController < ApplicationController
  def create
    @list = List.find_by_title(params[:list][:list_id])
    @items = @list.items.to_a
    @low_items = []
    
    @items.each do |item|
      if(item.quantity != nil)
        if(item.quantity <= params[:threshold].to_i)
        @low_items.push(item)
        end
      else
        @low_items.push(item)
      end
    end
  end
end