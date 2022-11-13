require "sinatra"
require "sinatra/reloader"
require "./User"
enable :sessions

get "/home" do
  erb(:home)
end
get "/login" do
  erb(:login)
end
post "/login" do
  @name=params[:user]
  @psw=params[:psw]
  user=User.get(@name)
  if user ==nil
    session[:login]="Can't find username"
    erb(:login)
  else
    if @psw==user.psw
      session[:user]=@name
      session[:win]=0
      session[:loss]=0
      session[:profit]=0
      redirect "/bet"
    else
      session[:login]="Wrong password"
      erb(:login)
    end
  end

end
get "/sign" do
  erb(:sign)
end
post "/sign" do
  @name=params[:user]
  @psw=params[:psw]
  if User.get(@name)!=nil
    session[:sign]="Username already exist"
    erb(:sign)
  else
    User.create(name:@name,psw:@psw,accWin:0,accLoss:0,accProfit:0)
    session[:user]=@name
    session[:win]=0
    session[:loss]=0
    session[:profit]=0
    redirect "/bet"
  end
end
get "/bet" do
  unless session[:user]
    redirect "/home"
  end
  @user=User.get(session[:user])
  @dice=rand(6)+1
  @money=params[:money].to_i
  on=params[:on].to_i

  if @dice== on
    session[:bet]="you win #{@money} on #{@dice}"
    session[:win]+=@money
    session[:profit]+=@money
    @user.accWin+=@money
    @user.accProfit+=@money
  else
    session[:bet]="you lose #{@money} on #{@dice}"
    session[:loss]+=@money
    session[:profit]-=@money
    @user.accLoss+=@money
    @user.accProfit-=@money

  end
  @user.save
  erb(:bet)
end
get "/logout" do
  session.clear
  redirect "/home"
end
