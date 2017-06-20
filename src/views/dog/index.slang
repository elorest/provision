div.row
  div.col-sm-11
    h2 Dogs
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/dogs/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Color
        th Actions
    tbody
    - dogs.each do |dog|
      tr
        td = dog.name
        td = dog.color
        td
          span
            a.btn.btn-primary.btn-xs href="/dogs/#{ dog.id }" read
            a.btn.btn-success.btn-xs href="/dogs/#{ dog.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/dogs/#{ dog.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

