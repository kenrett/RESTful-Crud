get '/' do

  erb :index
end

post '/create' do
  content_type :json
  
  @note = Note.create(title: params[:title], content: params[:content])
  @note.to_json
end

get '/read/:note_id' do
  @note = Note.find(params[:note_id])
  erb :read
end

post '/update' do

end

post '/delete' do

end
