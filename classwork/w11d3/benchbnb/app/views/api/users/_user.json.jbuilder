json.set! user.id do # normalizes state by nesting the user data under a key of id
  json.extract! user, :id, :username # the data we want to extract
end