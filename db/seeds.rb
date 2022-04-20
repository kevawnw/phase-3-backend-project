puts "creating main budget"

m1 = MainBudget.create!(balance: 4000)


puts "🌱 Seeding user..."

user1 = User.create!(name: "Dad", title: "Husband")
user2 = User.create!(name: "Mom", title: "Wife")
user3 = User.create!(name: "Daughter", title: "Child")
user4 = User.create!(name: "Son", title: "Child")

puts "seeding categories"

c1 = Category.create!(name: "Groceries")
c2 = Category.create!(name: "Clothes")
c3 = Category.create!(name: "Entertainment")
c4 = Category.create!(name: "Bills")

puts "Seeding wallet"

w1 = Wallet.create!(balance: 350.00, date: Time.now(), user: user1, category: c4, main_budget: m1 )
w2 = Wallet.create!(balance: 500.00, date: Time.now(), user: user2, category: c1, main_budget: m1)
w3 = Wallet.create!(balance: 280.00, date: Time.now(), user: user3, category: c2, main_budget: m1)
w4 = Wallet.create!(balance: 790.00, date: Time.now(), user: user4, category: c3, main_budget: m1)

puts "Seeding transaction"

 trans1 = Transaction.create!(description: "bought apples", amount: rand(0.00..200.00), date: Time.now(), wallet: Wallet.all.sample)
 trans2 = Transaction.create!(description: "bought tv", amount: rand(0.00..200.00), date: Time.now(), wallet: Wallet.all.sample)
 trans3 = Transaction.create!(description: "bought diapers", amount: rand(0.00..200.00), date: Time.now(), wallet: Wallet.all.sample)
 trans4 = Transaction.create!(description: "bought a mop", amount: rand(0.00..200.00), date: Time.now(), wallet: Wallet.all.sample)
 trans5 = Transaction.create!(description: "bought some coffee", amount: rand(0.00..200.00), date: Time.now(), wallet: Wallet.all.sample)
 trans6 = Transaction.create!(description: "bought a couch", amount: rand(0.00..200.00), date: Time.now(), wallet: Wallet.all.sample)





puts "✅ Done seeding!"
