json.id @movement.id
json.amount @movement.amount
json.concept @movement.concept
json.date @movement.date
json.kind @movement.kind
json.receiving_user do
  json.email @receiving_user.email
  json.name @receiving_user.first_name
  json.last_name @receiving_user.last_name
end
