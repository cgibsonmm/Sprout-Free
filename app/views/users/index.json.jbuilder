json.array!(@users) do |user|
  json.key user.username
  json.value user.username
end
