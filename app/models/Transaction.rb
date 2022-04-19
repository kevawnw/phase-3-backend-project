class Transaction < ActiveRecord::Base
    belongs_to :wallet
    
    def initialize attribute
        super attribute
        newbalance = self.wallet.balance - self.amount
        wallet.update(balance: newbalance)
    end

    def user
        self.wallet.user
    end

end