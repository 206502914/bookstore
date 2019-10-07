class BooksController < ApplicationController

before_filter :safecheck,:except=>[:login ,:prologin]
def safecheck
  
end

#进入登陆界面的页面
def login
  render :layout=>"default"
end

def prologin
  uname=params[:user][:name]
  upass=params[:user][:pass]
  if(uname=="admin" && upass=="admin")  then
  session[:user_name]=uname
  session[:user_pass]=upass
  redirect_to "/books/list", :notice=>"欢迎光临 当前用户:"+session[:user_name]
  else
  redirect_to "/books/login", :notice => '你的输入有误 登陆失败'
end
end

def list
  @books = Book.all
  render :file=>"books/cart", :layout=>"default"
end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    render :action=>"index",:layout=>"default"
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
   render :action=>"show",:layout=>"default"
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end
  
  
  def aboutus
    redirect_to books_url
  end
 

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end
end
