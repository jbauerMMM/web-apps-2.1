# 3. New and create

`new` already rendered the form in `app/views/companies/new.html.erb`. Read the form:
`action="/companies"` and `method="post"` are the `create` row of the pattern, and each
input's `name` is a key in `params`.

`create`: uncomment it and fill the steps. A new Company, the form's values into its columns
(hash-style, the keys are the input names), `save`, then `redirect_to("/companies")`. No `@`,
no view: create does the work and sends the user to a page that already exists.

Refresh the list after submitting and the browser warns about resubmitting the form: it knows
that request was a POST and that doing it again would make a second row. That is why `create`
redirects. The index gains a link to the form.
