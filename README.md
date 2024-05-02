# grafana-dashboards
Grafana dashboards for the IRIS, SCD Cloud, RAL Tier1, and SeaDataCloud accounting portals.

## Directory Structure

- `/dashboards` - Dashboard JSON files that go into the directory specified in the provisioning files (`/var/lib/grafana/dashboards/` in this case).
- `/docs` - Admin documentation.
- `/img` - Images used in the user guide panels which should be put in `/usr/share/grafana/public/img` so they can be accessed by the dashboard.
- `/provisioning` - Files that go into `/etc/grafana/provisioning` to define where Grafana can locate dashboard JSON files and what datasources it has access to. Note that the datasources file is a skeleton that would need the url, user and password added.
- `/schemas` - Contains SQL files used to set up and initialise additional databases used by the dashbaords.
- `/scripts` - Contains a utility script and config to apply a fixed colour mapping to all series within a dashboard JSON.

<br>

## Non-Quattor instillation

You first need a VM to work on and an IRIS account.
if you have set up the VM with Grafana properly then there should be a `grafana.ini` file in this path `/etc/grafana`.

Now you need to open the `grafana.ini` config file and make note of the domain which should look like this:
`domain=host-(`Hostname`).nubes.stfc.ac.uk`.

You will need a self signed certificate and key to put in `/etc/grid-security/hostcert.pem` and `/etc/grid-security/hostkey.pem` respectively.

Check the configuration of the datasources and set the password in `secrets/apel_db_pwd`. The details for that would come from whoever manages the database your using.

In IRIS Create a new client and give it a name,
for the Redirect URLs you will need the domain from the config file and it will look like this:
- `https://(`domain`):(`port`)/login/generic_oauth`
- `http://(`domain`):(`port`)/login/generic_oauth`

After that you will need to put the Client id you get from the client and put it in `/etc/grafana/secrets/iris_iam_client_id`.
You will also need to put Client secret from the Credentials section of client config into `/etc/grafana/secrets/iris_iam_client_secret`.
