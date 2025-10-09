### Let's see here list of issues may encounter while openshift cluster installation


## 𝐎𝐩𝐞𝐧𝐒𝐡𝐢𝐟𝐭 𝐈𝐧𝐬𝐭𝐚𝐥𝐥𝐚𝐭𝐢𝐨𝐧 & 𝐒𝐞𝐭𝐮𝐩 𝐈𝐬𝐬𝐮𝐞𝐬 
👉 DNS resolution failing for internal cluster domains even after proper config
👉 DHCP configuration mismatch caused bootstrap node not resolving cluster DNS.
👉 Incorrect 5533 port value persisted in dns-default ConfigMap despite manual edits.
👉 Need to roll out dns-default and node-resolver daemonsets after config changes.
👉 HAProxy backend misconfiguration affected external API resolution.

## 𝐎𝐃𝐅 / 𝐒𝐭𝐨𝐫𝐚𝐠𝐞 𝐈𝐬𝐬𝐮𝐞𝐬
👉 ODF StorageCluster stuck in Progressing due to missing csi-rbdplugin and rook-ceph-tools, while the csv status shows succeeded
👉 LocalVolume CR count (replica 3 vs 1, count 24) caused pending PV state.
👉 ODF tools not auto-created after deleting subscription; had to reconcile ocsinitialization.

## 𝐌𝐓𝐕 (𝐌𝐢𝐠𝐫𝐚𝐭𝐢𝐨𝐧 𝐓𝐨𝐨𝐥𝐤𝐢𝐭 𝐟𝐨𝐫 𝐕𝐢𝐫𝐭𝐮𝐚𝐥𝐢𝐳𝐚𝐭𝐢𝐨𝐧) 𝐈𝐬𝐬𝐮𝐞𝐬
👉 Migration plan imageConversion failed due to DNS not resolving source VM – 👉 Node level Vs Pod level resolutions
👉 Disk Transfer (DiskTransferV2V) phase stalled until DNS fixed.
👉 Warm migration PVC stuck in Pending until cut-over scheduled.
👉 MAC address duplication detected when migrated VM already existed in cluster.
👉 Post-migration VM boot loop (continuous restart) due to duplicate UUID or network policy.

## 𝐌𝐨𝐧𝐢𝐭𝐨𝐫𝐢𝐧𝐠 & 𝐆𝐫𝐚𝐟𝐚𝐧𝐚
👉 Grafana operator installed, but CRD GrafanaDatasource missing.
👉 Operator-based Grafana vs Helm-based deployment. How it fits the environment an what is the customer ask
👉 Bearer token for Prometheus datasource not documented; had to use ServiceAccount token.

## 𝐀𝐮𝐭𝐡𝐞𝐧𝐭𝐢𝐜𝐚𝐭𝐢𝐨𝐧 (𝐋𝐃𝐀𝐏 𝐈𝐧𝐭𝐞𝐠𝐫𝐚𝐭𝐢𝐨𝐧)
👉 Initial htpasswd provider working, LDAP integration took time to reconcile
👉 Wrong OU in URL (OU=ServiceAccounts vs OU=abcd ) caused bind failure.
👉 Missing username (admin) in secret → no bind authentication.
👉 Needed to use CN=admin and sAMAccountName in URL to work properly.
sAAMcoutName vs uid , when to use what options
👉 CLI login failed even when console worked  .. why

## 𝐍𝐞𝐭𝐰𝐨𝐫𝐤𝐢𝐧𝐠 / 𝐃𝐍𝐒 / 𝐅𝐢𝐫𝐞𝐰𝐚𝐥𝐥
👉 Different VLAN and bonding issues NNCP , NAD issues
👉 Restart named service after zone update; Serial number not incremented initially.
