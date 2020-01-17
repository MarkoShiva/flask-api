### bonus
A huge bonus point is for a person that will do the exercise in **AWS lambda** architecture.

NOTE: we are not only going to look on the code itself, we are going to look at the overall design, architecture, decision taken into consideration and more, so if you would like to shed more light, please provide it to us in a document of your choice).

Good luck.
## Description

##### Please build a REST API server (choose the stack you think is best suited for the exercise), we will need to have the following 3 API’s:

- [x] Create new users
    - [x] Create basic html for that purpose
    - [x] requires email, password & full name
    - [x] Save the user info to the database
- [x] Login
    - [x] Create basic html for that purpose
    - [x] requires email, password
        - [x] modify login so it uses email for login
    - [x] Validate the user info
        - [ ] need to check properly all write test maybe
    - [x] Fail the api on mismatch
        - [x] Maybe introduce 404 page instead of redirect to login
    - [x] Redirect the user to a page that only logged in users can access
- [x] Reset password
    - [x] Create basic html for that purpose
    - [x] User will need to provide his email
    - [x] An email will be sent to the user email with a reset password link (please pick an email provider with free tier and an API, to send the emails, like sendgrid)
    - [x] Clicking on the link will allow the user to change the previous password
    - [x] Once the user changed the password, send the user back to the login page

- [ ] Test the app