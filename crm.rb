require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :new
end

get '/contacts/:id' do
  id = params[:id].to_i
  @contact = Contact.find_by(id: id)
  if @contact != nil
    erb :show_contact
  else
    erb :four_o_four
  end
end

post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
end

after do
  ActiveRecord::Base.connection.close
end
