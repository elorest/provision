div.row
  div.col-sm-11
    h2 Birds
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/birds/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Age
        th Actions
    tbody
    - birds.each do |bird|
      tr
        td = bird.name
        td = bird.age
        td
          span
            a.btn.btn-primary.btn-xs href="/birds/#{ bird.id }" read
            a.btn.btn-success.btn-xs href="/birds/#{ bird.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/birds/#{ bird.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

