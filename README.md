# Open Time

A calm task manager built around closed time (classes, meetings, shifts) and open time.
Live at https://opentime.work

- `/` landing page · `/app/` the app · `/privacy/` and `/terms/`
- User data is stored privately in Supabase, never in this repo.

## Using this code

Open Time is free software under the GNU AGPL v3.0 (see `LICENSE`). You're welcome to
run, study, change and share it. If you run a modified version for other people,
including as a website, you must share your source code under the same license.

To run your own copy, create your own Supabase project, run the SQL setup, and put your
own project URL, public key and Turnstile site key in `app/config.js`. Please use a
different name and domain; "Open Time" and opentime.work refer to this project.
