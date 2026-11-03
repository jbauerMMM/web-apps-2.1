# 1. Bitcoins

The route, the controller (`bin/rails generate controller bitcoins`, then the `index` action
with the Week 4 code in it) and the view. The Ruby runs in the action; `@bitcoin`, `@usd_rate`
and `@usd_value` carry the results to the view; the view only shows them.

The action started with `@bitcoin = 1.5`. Then the amount came from the address:
`/bitcoins?amount=2.6` puts `{"amount" => "2.6"}` in `params`, and `.to_f` turns the string
into a number. With no amount, or `?amount=zebra`, `.to_f` gives 0.0.
