json.array! @auctions do |auction|
  json.id auction.id
  json.title auction.title
  # json.title question.title
  # json.created_at question.created_at.strftime('%Y-%B-%d')
  # json.created_at question.created_at.strftime('%Y, %B %d')
  # json.url api_v1_question_url(question)
end
