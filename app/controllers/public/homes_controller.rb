class Public::HomesController < ApplicationController

def top
  @items = Item.page(params[:page]).where(is_active: true)
end

def about
end

end
