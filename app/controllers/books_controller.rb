class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id) # .id can be ommited
      # redirect_to book_path('Ruby_on_Rails')
      # redirect_to "/books/#{@book.id}"
    else
      render 'index'
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to controller: :books, action: :show
    else
      render 'index'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to controller: :books, action: :index
    else
      render 'index'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
