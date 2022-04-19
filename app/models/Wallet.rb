class Wallet < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    has_many :transactions
    belongs_to :main_budget


    def initialize attribute
        super attribute
        newbudget = self.main_budget.balance - self.balance
        main_budget.update(balance: newbudget)
    end

    

end