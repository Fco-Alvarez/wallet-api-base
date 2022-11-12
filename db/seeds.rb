require 'faker'

# - El usuario 1 solo va a cargar de saldo a los otros
# - para correr los seeds necesitamos primero comentar el metodo de validacion
#   validate_sufficient_balance del modelo Transaction
#   porque solicitara primero que tenga saldo de quien va a transferir dinero

user1 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

user2 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

user3 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

user4 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

user5 = User.create(
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          password: 'password',
          rol: ['admin', 'regular'].sample
        )

[user1, user2, user3, user4, user5].each do |user|
  Account.create(
    user: user,
    currency: 'usd'
  )

  Account.create(
    user: user,
    currency: 'ars'
  )
end

[user1, user2, user3].each do |user|
  user.accounts.each do |account|
    (6..10).to_a.sample.times do
      amount = rand(1000..100_000)
      Movement.create(
        kind: 'topup',
        amount: amount,
        concept: Faker::Lorem.word,
        date: Faker::Date.birthday(min_age: 0, max_age: 5),
        user: user,
        account: account
      )
      account.update_column(:total, account.total + amount)
    end
  end
end

# Account.all.each do |account|
#   [1, 2, 3].sample.times do
#     Movement.create(
#       kind: 'topup',
#       amount: rand(1000..100_000),
#       concept: Faker::Lorem.word,
#       date: Faker::Date.birthday(min_age: 0, max_age: 5),
#       user: user1,
#       account: account
#     )
#   end
# end

# [user1, user2, user3].each do |user|
#   user.accounts.each do |account|
#     (6..10).to_a.sample.times do
#       Movement.create(
#         kind: 'topup',
#         amount: rand(1000..100000),
#         concept: Faker::Lorem.word,
#         date: Faker::Date.birthday(min_age: 0, max_age: 5),
#         user: user,
#         account: account
#       )
#     end
#     (1..4).to_a.sample.times do
#       Movement.create(
#         kind: 'payment',
#         amount: rand(1000..10000),
#         concept: Faker::Lorem.word,
#         date: Faker::Date.birthday(min_age: 0, max_age: 5),
#         user: user,
#         account: account
#       )
#     end
#   end
# end
