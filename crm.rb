require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
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

get '/new' do
  erb :new
end

after do
  ActiveRecord::Base.connection.close
end
