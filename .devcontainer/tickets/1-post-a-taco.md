# Post a taco
As a Tacostagram user, I want to post a photo of my tacos with a caption, so everyone can see what I'm eating.

## Definition of done

- The new post page shows a form with fields for the author, the body and the image.
- Submitting the form creates a post with the author, body and image that were entered.
- After submitting, the user lands on the posts page and sees the new post there.

## Notes

- The posts page already exists; the `posts` table has `author`, `body` and `image` columns.
- The image is the address of a picture on the internet (on unsplash.com, right-click a photo and choose Copy image address).
- Follow the pattern: `new` shows the form, `create` saves and redirects. Both go in `app/controllers/posts_controller.rb`, where the commented steps are.
