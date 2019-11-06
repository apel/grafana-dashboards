



## How to set up IRIS IAM on Grafana

1. Complete [client registration process on IAM ](https://indigo-iam.github.io/docs/v/current/user-guide/client-registration.html)

   Note:

   - Redirect URI: http:// \<hostname> /login/generic_oath
   - Take a note of whichever scope options you have chosen, and the client ID and secret, to be      entered in the config file in the next step.
   - You will have the option to save a client info file: do so, as you need to the Client ID and      Registration Access Token to go back and edit an existing client.

2. Configure grafana.ini file to have a generic_oauth section as follows:

   ```ini
   [auth.generic_oauth]

   enabled = true

   name = IRIS IAM

   allow_sign_up = true

   client_id =

   client_secret =

   scopes = openid profile email address phone offline_access preferred_username

   auth_url = https://iris-iam.stfc.ac.uk/authorize

   token_url = https://iris-iam.stfc.ac.uk/token

   api_url = https://iris-iam.stfc.ac.uk/userinfo

   allowed_domains = stfc.ac.uk
   ```



   (remove ';' characters in .ini file to uncomment lines)

   Edit the client_id, client_secret, scopes, and allowed_domains as required.

3. Add certificates to /etc/pki/ca-trust/source/anchors within Grafana VM


New users who log in through the IRIS IAM login option should be added to Grafana automatically with view only roles. allowed_domains must be specified: this is set to stfc.ac.uk in the configuration above, but there are lists available of all .ac.uk addresses.
