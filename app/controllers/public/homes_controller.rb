class Public::HomesController < ApplicationController

def top
  @items = Item.page(params[:page]).where(is_active: true).per(4)
end

def about
end

end
