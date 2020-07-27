## AUTH

# Agenda
1. Cookies
2. CSRF
3. Auth
  a. Model
  b. Controllers
  c. Views

### Cookies
- http req are stateless, cookies allow us to perist data on the client
- Rails gives us three ways to set/access cookies:
  + `cookies`: plain text, max expiration (generally don't use this one)
  + `session`: encrypted, expired at the end of the browser session, storing user session token (how user stays logged in)
  + `flash`: encrypted, expires at the end of the current or next res cycle (`flash` vs. `flash.now`), mostly used for storing errors or notifications (temporary message to show user)

### CSRF
- Cross Site Request Forgery: when a malicious website makes a non GET request to our backend (ex: form hidden in link)
- We can protect from this with CSRF tokens
- *every* form that makes a non GET request *must* include a CSRF token to ensure the request is coming from our own app:
  ` <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">`
    - this must be somewhere within the opening and closing `form` tags

### Auth
We need a way to track if a user is logged in.
We will use session tokens to track the `session`
**What does it mean to be 'logged in'?** (or have a `session`)?
  - session token in your cookie matches a session token in our users table
User model auth methods: 
**FIG VAPER**
  - `find_by_credentials`
  - `is_password?`
  - `generate_session_token`
  - validations
  - `attr_reader`
  - `password=`
  - `ensure_session_token`
  - `reset_session_token`
application controller auth methods: 
**CELLL**
  - `current_user`
  - `ensure_logged_in`
  - `login!`
  - `logout!`
  - `logged_in?`