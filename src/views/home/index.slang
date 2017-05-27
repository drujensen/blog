- posts.each do |post|
  time.pull-right = post.updated_at.not_nil!.to_s("%B %d, %Y")
  h2 = post.title
  article == Markdown.to_html(post.body.to_s)
  hr
