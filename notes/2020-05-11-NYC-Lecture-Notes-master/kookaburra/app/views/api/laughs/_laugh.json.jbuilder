json.set! laugh.id do # normalize state by nesting the laugh data under a key of id
  json.extract! laugh, :id, :body, :author_id # the data we want to extract

  # json.author do
  #   json.extract! laugh.author, :id, :username
  # end
  # this gives us the right structure, but it's not normalized - information is repeated unnecessarily
end