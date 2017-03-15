before '/libraries/:id/*' do
  require_user
  # binding.pry
  @library = Library.find_by(id: params[:id])
end

get '/libraries' do
  @libraries = Library.all
  erb(:"/libraries/index")
end

get '/libraries/:id/books' do
require_user
  @books = @library.books
  erb :"/books/index"
end

get '/libraries/:id/books/new' do
  require_user
  # @library =  Library.find_by(id: params[:id])
  if request.xhr?
    erb :'/books/_new', layout: false
  else
    erb :'/books/new'
  end
end


post '/libraries/:id/books' do
  require_user
  # @library = Library.find_by(id: params[:id])
  book = @library.books.new(params[:book])
  if request.xhr?
    # For AJAX Requests
    book.save
    erb :'/books/_book', layout: false, locals: {book: book}
  else
    if book.save
      redirect "/libraries/#{@library.id}/books"
    else
      @errors = book.errors.full_messages
      erb :'/books/new'
    end
  end

end

get '/libraries/:id/books/:book_id/edit' do
  @book = Book.find_by(id: params[:book_id])
  @library = @book.library
  erb :'/books/edit'
end

put '/libraries/:id/books/:book_id' do
  @book = Book.find_by(id: params[:book_id])
  @library = @book.library
  if @book.update(params[:book])
    redirect "/libraries/#{@library.id}/books"
  else
    @errors = @book.errors.full_messages
    erb :'/books/edit'
  end

end
