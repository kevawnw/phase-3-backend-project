class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/users" do 
    User.all.to_json(include: :wallets)
  end

  get '/transactions' do 
    Transaction.all.to_json(include: :user)
  end

end
