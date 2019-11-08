# How to set up IRIS IAM on Grafana

1. Make sure you have an IRIS IAM account by logging in to the [IRIS IAM](https://iris-iam.stfc.ac.uk/login) using your preferred identity provider (IdP).

1. Complete the [client registration process on IAM ](https://indigo-iam.github.io/docs/v/current/user-guide/client-registration.html)

   Note:

   - Redirect URI: http:// \<hostname> /login/generic_oath
   - Take a note of whichever scope options you have chosen, and the client ID and secret, to be entered in the config file in the next step.
   - You will have the option to save a client info file: do so, as you need to the Client ID and Registration Access Token to go back and edit an existing client.

1. Configure grafana.ini file to have a generic_oauth and server sections as follows:

   ```ini
   [server]
   root_url = 
   
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

   Edit the root_url, client_id, client_secret, scopes, and allowed_domains as required.

1. Add certificates to /etc/pki/ca-trust/source/anchors within Grafana VM. (Though this step can be skipped if not using HTTPS.)


New users who log in through the IRIS IAM login option should be added to Grafana automatically with view only roles. allowed_domains must be specified: this is set to stfc.ac.uk in the configuration above, but there are lists available of all .ac.uk addresses.
