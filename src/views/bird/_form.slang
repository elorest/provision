- if bird.errors
  ul.errors
  - bird.errors.each do |error|
    li = error

- action = (bird.id ? "/birds/" + bird.id.to_s : "/birds")
form action="#{ action }" method="post"
  - if bird.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="name" placeholder="Name" value="#{ bird.name }"
  div.form-group
    input.form-control type="text" name="age" placeholder="Age" value="#{ bird.age }"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/birds" back
