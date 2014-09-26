require 'twitter'
require 'sinatra'
require './configure'

get '/' do  
  @n_amigos = 0 # número de amigos
  @name = ''   # nombre de usuario twitter
  @usuarios = Hash.new	#almacenara los amigos y el numero de seguidores
  erb :twitter
end

post '/' do  
  @n_amigos = 0   
  @usuarios = Hash.new
  @name = params[:firstname] || ''  
  client = my_twitter_client()  
  
  if client.user? @name 
    
    a_user = client.user(@name)  
    @n_amigos = a_user.friends_count #recoge el numero de amigos del usuario
    amigos = client.friend_ids(@name).attrs[:ids].take(10) #muestra 10 amigos del usuario por el campo id
    
    if (@n_amigos < 10) 
        @n_amigos.times do |i| 
            user_n = client.user(amigos[i])
            @usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
        end 
        
    end
    if (@n_amigos >= 10)   
        10.times do |i|
            user_n = client.user(amigos[i])
            @usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
        end         
    end 
    
    @usuarios = @usuarios.sort_by {|k,v| -v} #te muestras los usuarios ordenados             
  end
  erb :twitter
end
