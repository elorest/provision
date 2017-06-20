- if dog.errors
  ul.errors
  - dog.errors.each do |error|
    li = error

- action = (dog.id ? "/dogs/" + dog.id.to_s : "/dogs")
form action="#{ action }" method="post"
  - if dog.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="name" placeholder="Name" value="#{ dog.name }"
  div.form-group
    input.form-control type="text" name="color" placeholder="Color" value="#{ dog.color }"
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/dogs" back
