get '/books' do
  @books = Book.all
  erb :'/books/index'
end

get '/books/new' do
  erb :'/books/new'
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
