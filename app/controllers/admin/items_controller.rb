class Admin::ItemsController < ApplicationController

def index
  @items = Item.all
end

def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  @item.save
end

def show
  @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
  @item.update(item_params)
  redirect_to admin_item_path
end

def update
end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price)
  end



end
