class MainBudget < ActiveRecord::Base
    has_many :wallets
end