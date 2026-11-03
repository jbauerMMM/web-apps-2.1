# web-apps-2

A Rails app with three resources, companies, contacts and posts, each built on the same
pattern: seven actions, named the same way everywhere. Some pages are finished, some are
half-written for you to complete, and two features are waiting as tickets.

## Getting started

1. On this repo's GitHub page, choose **Use this template**, then **Create a new repository**.
   Make the copy in your own account and choose **Private**.
2. On your copy, choose **Code**, then **Codespaces**, then **Create codespace on main**. The
   first start takes a few minutes: it installs the gems and the agent CLIs, creates the
   database with three companies, four contacts and two posts, and opens two tickets in your
   repo's **Issues** tab.
3. In the terminal, start the app:

       bin/rails server

   Leave that terminal running; open a second one for everything else. When the Codespace
   offers to open port 3000 in the browser, take it (or find it later under **Ports**). The
   home page lists every page in the app; click **Companies**.
4. Look at your repo's **Issues** tab on GitHub. Two tickets should be there. If the tab is
   empty, run `bin/ticket` in the second terminal and read what it says.

If the server isn't running, the browser shows "connection refused" or a 502. Start it again
with `bin/rails server`.

## The pattern

Every resource gets the same seven actions. One line in `config/routes.rb` makes all seven
routes: `resources("companies")`.

| Action | What it does | Method | Path | Has a view? |
|---|---|---|---|---|
| `index` | list every company | GET | `/companies` | yes |
| `show` | one company | GET | `/companies/7` | yes |
| `new` | the form for a new company | GET | `/companies/new` | yes |
| `create` | save the form, then redirect | POST | `/companies` | no |
| `edit` | the form for an existing company | GET | `/companies/7/edit` | yes |
| `update` | save the form, then redirect | PATCH | `/companies/7` | no |
| `destroy` | delete it, then redirect | DELETE | `/companies/7` | no |

`bin/rails routes` prints every route the app has, or visit `/rails/info/routes` while the
server runs.

## The three files a page needs

| File | What it does |
|---|---|
| `config/routes.rb` | Which path runs which action. `resources(...)` covers all seven at once; the long form is one line per page, like `/tacos`. |
| `app/controllers/<resource>_controller.rb` | A class with one method per action. The method decides what to show, or what to change. Each controller here has its steps written as comments. |
| `app/views/<resource>/<action>.html.erb` | The page itself: HTML, with Ruby inside `<% %>` and `<%= %>`. An action that redirects has no view. |

`@name` in an action is how a value gets to the view. A plain variable is gone when the method
ends.

## The tickets

Your repo's **Issues** tab has two tickets. Each has a story and, under "Definition of done",
three sentences that say when it's finished. `bin/ticket` made them from the files in
`.devcontainer/tickets/`; running it again is safe.

To build one, make a branch first, the way the roster repo did in week one: bottom-left corner
of the Codespace, click `main`, **Create new branch**, type `posts-form`, Enter. The corner now
says `posts-form`.

Then ask your agent to read the issue (`gh issue view 1`) and build it, with one test per
sentence. Try the page yourself and run `bin/rails test`. Commit with a message that says what
changed, **Publish Branch**, and open the pull request from the banner on your repo's GitHub
page. Put the issue number in the title or the body ("closes #1"), so merging the PR closes
the ticket.

## Reviewing someone else's pull request

Only a collaborator can review a private repo. On your repo's page: **Settings**,
**Collaborators**, **Add people**, their GitHub username. They accept from the email or from
github.com/notifications.

Then, on their PR: **Files changed**, read the diff, leave at least one comment on a line, then
**Review changes**. Five questions:

1. Does the change do what the issue says? Read the issue, then the diff.
2. Does the commit message tell you what changed, without opening the diff?
3. Does it follow the pattern? The right actions in the right controller, the form posts to
   the resource's path, `create` redirects.
4. Is there a test for every sentence in the issue, and do they pass when you run them?
5. Would you merge it? If not, what would you ask for?

Approve, or request changes and say which question failed. The author merges, then deletes
the branch.

## Catching up

`code-along-complete/` has the finished files from each code-along, at the same paths they
have in the app. See its README.

## The data

`scripts/create_data.rb` creates the rows. Change it and run it again any time:

    bin/rails runner scripts/create_data.rb

It deletes the companies, contacts and posts first, so it always ends with exactly the rows
in the file. `bin/rails runner scripts/show_data.rb` prints every table in the terminal, and
`/data` shows them in the browser.

The tables:

- `companies`: `name`, `city`, `state`, `url`
- `contacts`: `first_name`, `last_name`, `email`, `phone_number`, `company_id`
- `posts`: `author`, `body`, `image`

Each contact's `company_id` is the `id` of a row in `companies`.

`scripts/bitcoin.rb` is a Ruby file that reads the price of Bitcoin from the internet and
prints what some amount is worth. `bin/rails runner scripts/bitcoin.rb` runs it.

## Working with an agent

`AGENTS.md` tells your agent how work happens here: tickets, one test per sentence, the
pattern, the commands. The code rules it points at (plain forms, `params` as strings,
hash-style columns) are in `docs/code-style.md`. Signing in to an agent CLI is covered in the `agent-setup`
repo's README. Every conversation with your agent here is copied into `agent-log/`; leave that
folder alone.
