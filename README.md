# grafana-dashboards
Grafana dashboards for the IRIS and SeaDataCloud accounting portals

## Directory Structure

- `/dashboards` - Dashboard JSON files that go into the directory specified in the provisioning files (`/var/lib/grafana/dashboards/iris/` in this case).
- `/docs` - Admin documentation.
- `/img` - Images used in the user guide panels which should be put in `/usr/share/grafana/public/img` so they can be accessed by the dashboard.
- `/provisioning` - Files that go into `/etc/grafana/provisioning` to define where Grafana can locate dashboard JSON files and what datasources it has access to. Note that the datasources file is a skeleton that would need the url, user and password added.
- `/schemas` - Contains SQL files used to set up and initialise additional databases used by the dashbaords.
- `/scripts` - Contains a utility script and config to apply a fixed colour mapping to all series within a dashboard JSON.
