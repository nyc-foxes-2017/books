get '/books' do
  @books = Book.all
  erb :'/books/index'
end


get '/books/new' do
  # @library = Library.find_by(id: params[:id])
  erb :'/books/new'
end

get '/books/:id' do

  erb :'/books/index'
end


post '/books' do
  book = Book.new(params[:book])
  if book.save
    redirect '/books'
  else
    @errors = book.errors.full_messages
    erb :'/books/new'
  end
end
