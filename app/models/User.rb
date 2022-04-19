class User < ActiveRecord::Base
    has_many :wallets, dependent: :destroy
    has_many :transactions, through: :wallets
    has_many :categories, through: :wallets

end