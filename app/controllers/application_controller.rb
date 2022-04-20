class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/users" do 
    User.all.to_json
  end

  get '/transactions' do 
    Transaction.all.to_json(include: :user)
  end

  get '/wallet' do
    Wallet.all.to_json(include: :category)
  end 

  patch '/main-budget' do
    MainBudget.first.update(
      balance: params[:balance]
    ).to_json
  end

  post '/wallet' do 
    cat = Category.where(name: params[:category]).first_or_create
    Wallet.create(balance: params[:balance], date: params[:date], user_id: params[:user_id], category: cat, main_budget_id: params[:main_budget_id]
    ).to_json(include: :category)
  end

  get '/main-budget' do
    MainBudget.first.balance.to_json
  end

  delete '/transactions/:id' do
    transaction = Transaction.find(params[:id])
    transaction.destroy
    transaction.to_json
  end

end
