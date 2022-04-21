class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # This is the get
  
  get "/users" do 
    User.all.to_json(include: {wallets: {include: :category}})
  end

  get '/transactions' do 
    Transaction.all.to_json(include: :user)
  end

  get '/wallet' do
   Wallet.all.to_json(include: [:category, :user])
   
  end 


  get '/main-budget' do
    MainBudget.first.balance.to_json
  end

  # This is the post

  patch '/main-budget' do
    MainBudget.first.update(
      balance: params[:balance]
    ).to_json
  end

  post '/wallet' do 
    cat = Category.where(name: params[:category]).first_or_create
    Wallet.create(balance: params[:balance], date: params[:date], user_id: params[:user_id], category: cat, main_budget_id: params[:main_budget_id]
    ).to_json(include: [:category, :user])
  end

  post '/transactions' do
    Transaction.create(description: params[:description], amount: params[:amount], date: params[:date], wallet_id: params[:wallet_id]).to_json(include: :user)
  end

  post '/users' do
    User.create(name: params[:name]).to_json(include: {wallets: {include: :category}})
  end


  delete '/transactions/:id' do
    transaction = Transaction.find(params[:id])
    transaction.destroy
    transaction.to_json
  end

  delete '/wallets/:id' do
    wallet = Wallet.find(params[:id])
    wallet.destroy
    wallet.to_json
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end
end
