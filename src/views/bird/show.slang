p = bird.name
p = bird.age
p
  a.btn.btn-default.btn-xs href="/birds" back
  a.btn.btn-success.btn-xs href="/birds/#{ bird.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/birds/#{ bird.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
