# Add a contact to a company
As a CRM user, I want to add a contact from a company's page, so the contact belongs to that company without me typing its id.

## Definition of done

- A company's page has a link to a form for adding a contact to that company.
- Submitting the form creates a contact whose company_id is that company's id.
- After submitting, the user lands back on the company's page and sees the new contact listed.

## Notes

- The `contacts` table has `first_name`, `last_name`, `email`, `phone_number` and `company_id`.
- The company's id travels with the request, not in a text box: put it in the link as a query string, and in the form as `<input type="hidden" name="company_id" value="...">`.
- Follow the pattern: `new` shows the form, `create` saves and redirects. Both go in `app/controllers/contacts_controller.rb`, where the commented steps are.
