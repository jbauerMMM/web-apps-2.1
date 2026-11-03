# 4. Edit, update and destroy, by the agent

Not typed in class. Ben gave Claude Code one prompt:

> Finish the edit, update and destroy actions in app/controllers/companies_controller.rb,
> following the commented steps there and the pattern of the actions already written. Add
> app/views/companies/edit.html.erb (a form like new.html.erb, filled with the company's
> current values), a link to it from the company's show page, and a Delete button on the show
> page. Don't touch the posts files. Tell me what you changed, file by file.

Nothing about routes, `params`, `find_by` or redirects was in the prompt. The agent read the
pattern in the actions already written and the comments in the stubs, and these three files are
what it produced (the controller keeps every step comment). A browser can only GET and POST, so
the edit form and the Delete button are POST forms with a hidden `_method` field that tells
Rails to treat them as PATCH and DELETE.
