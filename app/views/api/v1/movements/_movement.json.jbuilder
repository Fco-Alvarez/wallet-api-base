json.id movement.id
json.amount movement.amount
json.concept movement.concept
json.date movement.date
json.kind movement.kind
json.account do
  json.id movement.account_id
  json.currency movement.account.currency
  json.total movement.account.total
end
# json.user do
#   json.email @movement.user.email
#   json.name @movement.user.first_name
#   json.last_name @movement.user.last_name
# end
