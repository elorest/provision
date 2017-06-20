p = dog.name
p = dog.color
p
  a.btn.btn-default.btn-xs href="/dogs" back
  a.btn.btn-success.btn-xs href="/dogs/#{ dog.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/dogs/#{ dog.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
