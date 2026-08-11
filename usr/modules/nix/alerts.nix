# Known, accepted alerts muted fleet-wide.
#
# Some alerts are accurate but not actionable: a backup disk kept deliberately
# full trips `DiskSpaceLow` forever. Each entry here becomes an Alertmanager
# route to the `null` receiver: the alert still fires and stays visible in the
# Prometheus, Alertmanager and Grafana UIs, it just stops notifying.
#
# | Field | Role |
# |---|---|
# | `alert` | Alert name to mute (`alertname` label) |
# | `host` | Hostname to target (`host` label), `null` for the whole fleet |
# | `matchers` | Extra exact label matchers, ANDed together |
# | `reason` | Mandatory: why the alert is accepted |
#
# :::caution[Last resort]
# A silence hides a real signal. Fix or reconfigure the underlying condition
# first. `reason` is mandatory so the list stays auditable, and should say what
# would make the silence removable.
# :::
#
# :::note[Why here and not in usr/machines/<host>/]
# A zone's rules and routes are generated on the host running Prometheus, not on
# the machine the alert is about. Hosts are evaluated independently, so a
# per-machine file never reaches the monitoring host. `usr/modules` is imported
# everywhere: declaring silences here makes them visible to every Prometheus,
# and keeps what is deliberately ignored in a single, auditable file. The option
# is inert on hosts without Prometheus.
# :::
#
# A silence only covers the `alertname` it names: muting `DiskSpaceLow` on a
# mount leaves `DiskSpaceCritical` and `DiskWillFillSoon` fully armed on that
# same mount, so a genuine fill-up still pages.

{
  darkone.service.prometheus.alerting.silences = [

    # {
    #   alert = "DiskSpaceLow";
    #   host = "lan-01";
    #   matchers.mountpoint = "/mnt/backup";
    #   reason = ''
    #     Backup disk deliberately kept near full, so the 15% threshold is
    #     structurally crossed and the alert is permanent. DiskSpaceCritical (5%)
    #     stays armed. Remove once retention is reduced or the disk is replaced.
    #   '';
    # }
  ];
}
