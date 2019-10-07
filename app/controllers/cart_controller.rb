class CartController < ApplicationController
  def index
     @books = Book.all
     render :file=>"/books/cart", :layout=>"default"
  end
  
   def error
    render  :text=> '<h1>很抱歉 你访问的页面不存在<img src="/imgs/404.gif"/></h1>' , :layout=>"default"  
  end
  
  def first
  @book = Book.find(1)
  redirect_to "/books/1", :notice=>"欢迎你查看购物车中的物品信息."
  end
  
end
