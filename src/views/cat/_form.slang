- if cat.errors
  ul.errors
  - cat.errors.each do |error|
    li = error

- action = (cat.id ? "/cats/" + cat.id.to_s : "/cats")
form action="#{ action }" method="post"
  - if cat.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="name" placeholder="Name" value="#{ cat.name }"
  div.form-group
    input.form-control type="text" name="age" placeholder="Age" value="#{ cat.age }"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/cats" back
