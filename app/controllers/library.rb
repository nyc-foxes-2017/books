before '/libraries/:id/*' do
  # binding.pry
  @library = Library.find_by(id: params[:id])
end

get '/libraries' do
  @libraries = Library.all
  erb(:"/libraries/index")
end

get '/libraries/:id/books' do
  # binding.pry
  # @library = Library.find_by(id: params[:id])
  @books = @library.books
  erb :"/books/index"
end

get '/libraries/:id/books/new' do
  # @library =  Library.find_by(id: params[:id])
  erb :'/books/new'
end


post '/libraries/:id/books' do
  # @library = Library.find_by(id: params[:id])
  book = @library.books.new(params[:book])
  if book.save
    redirect "/libraries/#{@library.id}/books"
  else
    @errors = book.errors.full_messages
    erb :'/books/new'
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
