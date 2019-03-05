# flutter_architecture_samples_login
Similar in principle to flutter_architecture_samples repository, but project is login screen, as it allows to check how implemented architecture handles view state, loadings and global (app wide) state

# project specification

* main screen

- shows if usser is logged in (true / false)
- if user is logged in -> logout option is available
- else login option is available -> go to "login screen"

* login screen

- username textfield
- password masked textfield
- login button
- back button -> goes to main screen

- password has two rules - at last 1 digit and at last 8 characters
- those rules are validated per character changed in password textfield
- login button is enabled only if login is not empty and password rules are fulfilled

- after login tap, there is spinner presented for a few seconds, no user interactions should be possible during that time (simulates https request)
- if login == "flutter" && password == "flutter1" -> go to next screen ("main screen")
- else show login error, after acked, login screen has user interactions enabled again. Login is preserved, password is cleaned.
