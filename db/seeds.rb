require 'faker'

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

Account.create(
  user: user1,
  currency: 'usd'
)

Account.create(
  user: user1,
  currency: 'ars'
)

Account.create(
  user: user2,
  currency: 'usd'
)

Account.create(
  user: user2,
  currency: 'ars'
)

Account.create(
  user: user3,
  currency: 'usd'
)

Account.create(
  user: user3,
  currency: 'ars'
)

[user1, user2, user3].each do |user|
  user.accounts.each do |account|
    (6..10).to_a.sample.times do
      Transaction.create(
        kind: 'topup',
        amount: rand(1000..100_000),
        concept: Faker::Lorem.word,
        date: Faker::Date.birthday(min_age: 0, max_age: 5),
        user: user,
        account: account
      )
    end
    (1..4).to_a.sample.times do
      Transaction.create(
        kind: 'payment',
        amount: rand(1000..10_000),
        concept: Faker::Lorem.word,
        date: Faker::Date.birthday(min_age: 0, max_age: 5),
        user: user,
        account: account
      )
    end
  end
end
