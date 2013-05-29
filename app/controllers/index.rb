get '/' do

  erb :index
end

post '/create' do
  content_type :json
  
  @note = Note.create(id: params[:id], title: params[:title], content: params[:content])
  @note.to_json
end

get '/read/:note_id' do
  p params
  @note = Note.find(params[:note_id])
  erb :read
end

get '/update/:note_id' do
  @note = Note.find(params[:note_id])
  erb :update
end

put '/update/:note_id' do 
  @note = Note.find(params[:note_id])
  @note.content = params[:content]
  @note.save
  content_type :json
  @note.to_json
  redirect '/'
end

get '/delete/:note_id' do
  @note = Note.find(params[:note_id])
  @title = "Confirm deletion of note ##{params[:id]}"  
  erb :delete 
end

delete '/:note_id' do
  n = Note.find(params[:note_id])  
  n.destroy  
  redirect '/'
end
