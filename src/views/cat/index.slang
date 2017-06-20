div.row
  div.col-sm-11
    h2 Cats
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/cats/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Age
        th Actions
    tbody
    - cats.each do |cat|
      tr
        td = cat.name
        td = cat.age
        td
          span
            a.btn.btn-primary.btn-xs href="/cats/#{ cat.id }" read
            a.btn.btn-success.btn-xs href="/cats/#{ cat.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/cats/#{ cat.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

