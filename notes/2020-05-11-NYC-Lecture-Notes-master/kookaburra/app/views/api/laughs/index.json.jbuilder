# json.array! @laughs, :id, :body

# debugger

# this file returns a stringified JS object that will have keys of whatever we set below

json.laughs do # we'll send up laughs under a key of laughs
  @laughs.each do |laugh| # iterate through the laughs
  # json.set! laugh.id do
  #   json.extract! laugh, :id, :body
  # end
  
  json.partial! "api/laughs/laugh", laugh: laugh # this partial is called for each of the laughs in the list of laughs
  end
end

json.users do # we'll also send up user information under a key of users
  @laughs.each do |laugh|
    author = laugh.author # we can use any Ruby code we want in this file
    json.set! author.id do # preserve normalized state
      json.extract! author, :id, :username
    end
  end
end