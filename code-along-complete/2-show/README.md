# 2. Index and show

`index`: the `Company.all` line moves from the top of the view into the action, as
`@companies`, and the view loops over `@companies`. The page looks the same.

`show`: `/companies/7` puts `{"id" => "7"}` in `params`. The action finds that company with
`find_by` and its contacts with `where`, and the view (a fixed mock until now) shows them.
Each name on the index is a link to its page.

`/companies/99`: `find_by` finds nothing, `@company` is nil, and the view fails on
`@company["name"]`. A real app shows a "not found" page here.
