- if post.errors
  ul.errors
  - post.errors.each do |error|
    li = error

- action = (post.id ? "/posts/" + post.id.to_s : "/posts")
form action="#{ action }" method="post"
  == csrf_tag(context)
  - if post.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="title" placeholder="Title" value="#{ post.title }"
  div.form-group
    textarea.form-control rows="10" name="body" placeholder="Body" =  post.body
  div.form-group
    div.checkbox
      label
        input type="hidden" name="published" value="false"
        - if post.published
          input type="checkbox" name="published" value="true" checked="true" Published
        - else
          input type="checkbox" name="published" value="true" Published
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/posts" back
