

Issues

```
$ /usr/bin/docker --config docker_config compose --progress plain --file docker-compose.yml --project-name openstudiolandscapes-infra up --remove-orphans
teleport  | ERROR: unable to verify HTTPS certificate chain in /certs/openstudiolandscapes.cloud-ip.cc_ecc/fullchain.cer:                      
teleport  | 
teleport  |   The Proxy Service was unable to validate the certificate chain of the
teleport  |   configured TLS certificate. The authority that issued this certificate is not
teleport  |   trusted on this host. Using an untrusted certificate is likely to cause
teleport  |   connection problems when clients and other Teleport services connect to this
teleport  |   Proxy Service. To trust a custom certificate authority you may set the
teleport  |   SSL_CERT_FILE or SSL_CERT_DIR environment variables to a path with your
teleport  |   authority's certificate chain.
teleport  | 
teleport  |   x509: certificate signed by unknown authority
teleport  | 
teleport exited with code 1 (restarting)
```

Is this related to `letsencrypt_test`?
```
Certificate CA:
1) letsencrypt
2) letsencrypt_test
[...]
```

Yes, it is.

No problem with `letsencrypt` CA:

```
$ /usr/bin/docker --config docker_config compose --progress plain --file docker-compose.yml --project-name openstudiolandscapes-infra up --remove-orphans
Attaching to teleport
teleport  | 2025-11-03T12:39:25.666Z INFO  Starting Teleport with a config file version:18.2.4 config_file:/etc/teleport/teleport.yaml common/teleport.go:879
teleport  | 2025-11-03T12:39:26.190Z INFO [PROC:1]    Service is creating new listener. pid:7.1 type:debug address:/var/lib/teleport/debug.sock service/signals.go:242
teleport  | 2025-11-03T12:39:26.211Z INFO [PROC:1]    Generating new host UUID pid:7.1 host_uuid:88d9e166-1c4b-478e-b28d-5abb7859ceb9 storage/storage.go:356
teleport  | 2025-11-03T12:39:27.212Z INFO  scoped access cache fetched initial state elapsed:316.896µs access/access.go:263
teleport  | 2025-11-03T12:39:27.212Z INFO  scoped access cache successfully initialized access/access.go:270
teleport  | 2025-11-03T12:39:27.225Z INFO [AUTH:1]    Updating cluster configuration pid:7.1 static_tokens:StaticTokens([]) trace_id:9416cb8a409b3547137e07baf041f577 span_id:df9dd2d624921fe0 auth/init.go:581
teleport  | 2025-11-03T12:39:27.226Z INFO [AUTH:1]    Creating access graph settings pid:7.1 settings:kind:"access_graph_settings"  version:"v1"  metadata:{name:"access-graph-settings"}  spec:{secrets_scan_config:ACCESS_GRAPH_SECRETS_SCAN_CONFIG_DISABLED}  status:{} trace_id:9416cb8a409b3547137e07baf041f577 span_id:7fa80ab16050bb44 auth/init.go:1219
teleport  | 2025-11-03T12:39:27.226Z INFO [AUTH:1]    Creating VNet config pid:7.1 vnet_config:kind:"vnet_config"  version:"v1"  metadata:{name:"vnet-config"}  spec:{ipv4_cidr_range:"100.64.0.0/10"} trace_id:9416cb8a409b3547137e07baf041f577 span_id:c68d860f89b89430 auth/init.go:1242
teleport  | 2025-11-03T12:39:27.226Z INFO [AUTH:1]    Creating cluster networking configuration pid:7.1 networking_config:Kind:"cluster_networking_config" Version:"v2" Metadata:<Name:"cluster-networking-config" Namespace:"default" Labels:<key:"teleport.dev/origin" value:"config-file" > > Spec:<KeepAliveInterval:300000000000 KeepAliveCountMax:3 ProxyListenerMode:Multiplex TunnelStrategy:<AgentMesh:<> > >  trace_id:9416cb8a409b3547137e07baf041f577 span_id:2d2e1e5f03bf3636 auth/init.go:1141
teleport  | 2025-11-03T12:39:27.228Z INFO [AUTH:1]    Creating cluster auth preference pid:7.1 auth_preference:AuthPreference(Type="local",SecondFactors=["SECOND_FACTOR_TYPE_OTP"]) trace_id:9416cb8a409b3547137e07baf041f577 span_id:47c02274fe450dd8 auth/init.go:1100
teleport  | 2025-11-03T12:39:27.259Z INFO [AUTH:1]    Creating session recording config pid:7.1 recording_config:Kind:"session_recording_config" Version:"v2" Metadata:<Name:"session-recording-config" Namespace:"default" Labels:<key:"teleport.dev/origin" value:"defaults" > > Spec:<Mode:"node" ProxyChecksHostKeys:"\010\001" >  trace_id:9416cb8a409b3547137e07baf041f577 span_id:72021aa761ca53aa auth/init.go:1181
teleport  | 2025-11-03T12:39:27.273Z INFO [AUTH:1]    Starting migration. pid:7.1 version:1 name:create_db_cas trace_id:9416cb8a409b3547137e07baf041f577 span_id:df9dd2d624921fe0 migration/migration.go:119
teleport  | 2025-11-03T12:39:27.282Z INFO [AUTH:1]    Completed migration. pid:7.1 version:1 name:create_db_cas trace_id:9416cb8a409b3547137e07baf041f577 span_id:df9dd2d624921fe0 migration/migration.go:139
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:bound_keypair trace_id:9416cb8a409b3547137e07baf041f577 span_id:fe4fcfa34eaa13b1 auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:spiffe trace_id:9416cb8a409b3547137e07baf041f577 span_id:97f0c122a2f7ac7e auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:host trace_id:9416cb8a409b3547137e07baf041f577 span_id:db687a0ce1a54348 auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:okta trace_id:9416cb8a409b3547137e07baf041f577 span_id:3a78b40492ca27f0 auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:saml_idp trace_id:9416cb8a409b3547137e07baf041f577 span_id:8e28888a1a1658a3 auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:openssh trace_id:9416cb8a409b3547137e07baf041f577 span_id:5019862b8043d1d4 auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:awsra trace_id:9416cb8a409b3547137e07baf041f577 span_id:ab5315ca7d94487b auth/init.go:773
teleport  | 2025-11-03T12:39:27.283Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:user trace_id:9416cb8a409b3547137e07baf041f577 span_id:c5e4f922d3a82ac3 auth/init.go:773
teleport  | 2025-11-03T12:39:27.284Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:oidc_idp trace_id:9416cb8a409b3547137e07baf041f577 span_id:fa20d7cfa878ba02 auth/init.go:773
teleport  | 2025-11-03T12:39:27.284Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:db_client trace_id:9416cb8a409b3547137e07baf041f577 span_id:0035926493c2bef9 auth/init.go:773
teleport  | 2025-11-03T12:39:27.284Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:db trace_id:9416cb8a409b3547137e07baf041f577 span_id:0d5f571261f86a01 auth/init.go:773
teleport  | 2025-11-03T12:39:27.290Z INFO [AUTH:1]    First start: generating certificate authority pid:7.1 ca_type:jwt trace_id:9416cb8a409b3547137e07baf041f577 span_id:63475ed1c05cf3c1 auth/init.go:773
teleport  | 2025-11-03T12:39:27.490Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:access-plugin time:2025-11-03T12:39:27.49Z trace.component:audit uid:8c0c1a75-078c-4096-993f-5a6b01204df2 user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.494Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:mcp-user time:2025-11-03T12:39:27.495Z trace.component:audit uid:ff29e441-a74e-46cd-a217-fd56c0c3475b user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.499Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:access time:2025-11-03T12:39:27.499Z trace.component:audit uid:c49c1dbd-a1e1-491e-b5d7-296565e52507 user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.504Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:list-access-request-resources time:2025-11-03T12:39:27.504Z trace.component:audit uid:9c7b3078-7bdb-4efb-bac1-5fac2cd515b2 user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.508Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:editor time:2025-11-03T12:39:27.509Z trace.component:audit uid:c548fe76-d1fa-4271-9a98-61d72c0bbddb user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.513Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:terraform-provider time:2025-11-03T12:39:27.513Z trace.component:audit uid:5be89dfa-97fd-4522-a0e7-66d2ed0bc743 user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.518Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:wildcard-workload-identity-issuer time:2025-11-03T12:39:27.518Z trace.component:audit uid:746dadce-b685-4e9a-add5-bfb53fd3b1b1 user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.522Z INFO  emitting audit event event_type:role.created fields:map[cluster_name:teleport.openstudiolandscapes.cloud-ip.cc code:T9000I ei:0 event:role.created expires:0001-01-01T00:00:00Z name:auditor time:2025-11-03T12:39:27.523Z trace.component:audit uid:bb59f507-981b-47b8-ac71-22a29a131c13 user:system] events/emitter.go:287
teleport  | 2025-11-03T12:39:27.533Z INFO [AUTH:1]    Auth server is running periodic operations pid:7.1 trace_id:9416cb8a409b3547137e07baf041f577 span_id:df9dd2d624921fe0 auth/init.go:693
teleport  | 2025-11-03T12:39:27.538Z INFO [AUTH:COMP] upload completer starting check_interval:5m0s events/complete.go:165
teleport  | 2025-11-03T12:39:27.539Z INFO [PROC:1]    Successfully obtained credentials to connect to the cluster. pid:7.1 identity:Admin service/connect.go:383
teleport  | 2025-11-03T12:39:27.549Z INFO [PROC:1]    The process successfully wrote the credentials and state to the disk. pid:7.1 identity:Admin service/connect.go:429
teleport  | 2025-11-03T12:39:27.559Z INFO [AUTH:1:CA] Cache first init succeeded target:auth cache/cache.go:919
teleport  | 2025-11-03T12:39:27.559Z INFO [PROC:1]    Service is creating new listener. pid:7.1 type:auth address:0.0.0.0:3025 service/signals.go:242
teleport  | 2025-11-03T12:39:27.560Z WARN [AUTH:1]    'proxy_protocol' unspecified. Starting Auth service with external PROXY protocol support, but IP pinned connection affected by PROXY headers will not be allowed. Set 'proxy_protocol: on' in 'auth_service' config if Auth service runs behind L4 load balancer with enabled PROXY protocol, or set 'proxy_protocol: off' otherwise pid:7.1 service/service.go:2566
teleport  | 2025-11-03T12:39:27.563Z INFO [WORKLOAD_] Starting to generate new CRL workloadidentityv1/revocation_service.go:610
teleport  | 2025-11-03T12:39:27.563Z WARN [AUTH:1]    Configuration setting auth_service/advertise_ip is not set, using inferred address pid:7.1 address:192.168.178.195:3025 service/service.go:2649
teleport  | 2025-11-03T12:39:27.563Z INFO [WORKLOAD_] Finished generating new CRL revocations:0 workloadidentityv1/revocation_service.go:662
teleport  | 2025-11-03T12:39:27.563Z INFO [AUTH:1]    Auth service is starting. pid:7.1 version:18.2.4 git_ref:v18.2.4-0-gb7ab869 listen_address:192.168.178.195:3025 service/service.go:2603
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  starting upload completer service pid:7.1 service/service.go:3600
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log/upload service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [AUTH:1]    Starting autoupdate_agent_rollout controller pid:7.1 component:rollout-controller period:1m0s rollout/controller.go:118
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log/upload/streaming service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log/upload/streaming/default service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log/upload service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log/upload/corrupted service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1]  Creating directory. pid:7.1 directory:/var/lib/teleport/log/upload/corrupted/default service/service.go:3616
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD]    uploader server ready scan_dir:/var/lib/teleport/log/upload/streaming/default scan_period:5s filesessions/fileasync.go:197
teleport  | 2025-11-03T12:39:27.563Z INFO [UPLOAD:1:] upload completer starting check_interval:5m0s events/complete.go:165
teleport  | 2025-11-03T12:39:27.573Z INFO [PROC:1]    Successfully obtained credentials to connect to the cluster. pid:7.1 identity:Proxy service/connect.go:383
teleport  | 2025-11-03T12:39:27.579Z INFO [PROC:1]    Successfully obtained credentials to connect to the cluster. pid:7.1 identity:Instance service/connect.go:383
teleport  | 2025-11-03T12:39:27.583Z INFO [PROC:1]    features loaded from auth server pid:7.1 identity:Instance features:Kubernetes:true App:true DB:true Desktop:true DeviceTrust:<> AccessRequests:<> AccessList:<> AccessMonitoring:<> Policy:<> SupportType:SUPPORT_TYPE_FREE JoinActiveSessions:true entitlements:<key:"AccessGraphDemoMode" value:<> > entitlements:<key:"AccessLists" value:<> > entitlements:<key:"AccessMonitoring" value:<> > entitlements:<key:"AccessRequests" value:<> > entitlements:<key:"App" value:<enabled:true > > entitlements:<key:"CloudAuditLogRetention" value:<> > entitlements:<key:"DB" value:<enabled:true > > entitlements:<key:"Desktop" value:<enabled:true > > entitlements:<key:"DeviceTrust" value:<> > entitlements:<key:"ExternalAuditStorage" value:<> > entitlements:<key:"FeatureHiding" value:<> > entitlements:<key:"HSM" value:<> > entitlements:<key:"Identity" value:<> > entitlements:<key:"JoinActiveSessions" value:<enabled:true > > entitlements:<key:"K8s" value:<enabled:true > > entitlements:<key:"LicenseAutoUpdate" value:<> > entitlements:<key:"MobileDeviceManagement" value:<> > entitlements:<key:"OIDC" value:<> > entitlements:<key:"OktaSCIM" value:<> > entitlements:<key:"OktaUserSync" value:<> > entitlements:<key:"Policy" value:<> > entitlements:<key:"SAML" value:<> > entitlements:<key:"SessionLocks" value:<> > entitlements:<key:"UnrestrictedManagedUpdates" value:<> > entitlements:<key:"UpsellAlert" value:<> > entitlements:<key:"UsageReporting" value:<> >  service/connect.go:1180
teleport  | 2025-11-03T12:39:27.585Z INFO [AUTH:SPIF] Obtained lock, SPIFFEFederation syncer is starting pid:7.1 machineidv1/spiffe_federation_syncer.go:219
teleport  | 2025-11-03T12:39:27.594Z INFO [PROC:1]    Successfully obtained credentials to connect to the cluster. pid:7.1 identity:App service/connect.go:383
teleport  | 2025-11-03T12:39:27.599Z INFO [PROC:1]    The process successfully wrote the credentials and state to the disk. pid:7.1 identity:Instance service/connect.go:429
teleport  | 2025-11-03T12:39:27.599Z INFO [INSTANCE:] Successfully registered instance client. pid:7.1 service/service.go:3166
teleport  | 2025-11-03T12:39:27.599Z INFO [PROC:1]    Reusing Instance client. pid:7.1 identity:App additional_system_roles:[Auth Proxy App] service/connect.go:1151
teleport  | 2025-11-03T12:39:27.599Z INFO [PROC:1]    Reusing Instance client. pid:7.1 identity:Proxy additional_system_roles:[Auth Proxy App] service/connect.go:1151
teleport  | 2025-11-03T12:39:27.618Z INFO [PROC:1]    The process successfully wrote the credentials and state to the disk. pid:7.1 identity:App service/connect.go:429
teleport  | 2025-11-03T12:39:27.622Z INFO [PROC:1]    The process successfully wrote the credentials and state to the disk. pid:7.1 identity:Proxy service/connect.go:429
teleport  | 2025-11-03T12:39:27.629Z INFO [APP:SERVI] Cache first init succeeded target:apps cache/cache.go:919
teleport  | 2025-11-03T12:39:27.630Z INFO [PROXY:1:C] Cache first init succeeded target:proxy cache/cache.go:919
teleport  | 2025-11-03T12:39:27.630Z INFO [PROC:1]    Service is creating new listener. pid:7.1 type:proxy:ssh address:0.0.0.0:3023 service/signals.go:242
teleport  | 2025-11-03T12:39:27.630Z INFO [PROC:1]    Service is creating new listener. pid:7.1 type:proxy:web address:0.0.0.0:443 service/signals.go:242
teleport  | 2025-11-03T12:39:27.630Z INFO [PROC:1]    Service is creating new listener. pid:7.1 type:proxy:tunnel address:0.0.0.0:3024 service/signals.go:242
teleport  | 2025-11-03T12:39:27.631Z INFO [PROXY:SER] Starting reverse tunnel server pid:7.1 version:18.2.4 git_ref:v18.2.4-0-gb7ab869 listen_address:0.0.0.0:3024 cache_policy:in-memory cache service/service.go:4975
teleport  | 2025-11-03T12:39:27.631Z INFO [PROXY:CER] Starting periodic reloading of certificate key pairs reload_interval:2m0s service/certreloader.go:79
teleport  | 2025-11-03T12:39:27.632Z INFO [PROXY:SER] Starting web proxy service. pid:7.1 version:18.2.4 git_ref:v18.2.4-0-gb7ab869 listen_address:0.0.0.0:443 service/service.go:5236
teleport  | 2025-11-03T12:39:27.632Z INFO [WEB]       Proxy handler features watcher has started interval:8m41.283969322s web/features.go:53
teleport  | 2025-11-03T12:39:27.632Z INFO [WEB]       Proxy handler features watcher has started interval:8m41.283969322s web/features.go:53
teleport  | 2025-11-03T12:39:27.632Z INFO [PROXY:SER] TLS multiplexer is starting. pid:7.1 listen_address:0.0.0.0:3024 service/service.go:5894
teleport  | 2025-11-03T12:39:27.632Z INFO [PROXY:SER] Minimal web proxy service is starting. pid:7.1 version:18.2.4 git_ref:v18.2.4-0-gb7ab869 listen_address:0.0.0.0:3024 service/service.go:5921
teleport  | 2025-11-03T12:39:27.632Z INFO [PROXY:SER]  Starting SSH proxy service pid:7.1 version:18.2.4 git_ref:v18.2.4-0-gb7ab869 listen_address:0.0.0.0:3023 service/service.go:5496
teleport  | 2025-11-03T12:39:27.632Z INFO [PROXY:AGE] Starting reverse tunnel agent pool pid:7.1 service/service.go:5548
teleport  | 2025-11-03T12:39:27.632Z INFO [PROXY:PRO] Starting Kube proxy. pid:7.1 listen_address:[::]:443 service/service.go:5643
teleport  | 2025-11-03T12:39:27.632Z INFO [DB:SERVIC] Starting Database TLS proxy server. pid:7.1 listen_address:0.0.0.0:443 service/service.go:5757
teleport  | 2025-11-03T12:39:27.632Z INFO [DB:SERVIC] Starting Database Postgres proxy server. pid:7.1 listen_address:[::]:443 service/service.go:5739
teleport  | 2025-11-03T12:39:27.632Z INFO [PROC:1]    Starting proxy gRPC server. pid:7.1 listen_address:[::]:443 service/service.go:6961
teleport  | 2025-11-03T12:39:27.633Z INFO [PROXY:SER] Starting TLS ALPN SNI reverse tunnel proxy server. pid:7.1 listen_address:[::]:3024 service/service.go:5855
teleport  | 2025-11-03T12:39:27.633Z INFO [PROC:1]    Starting proxy gRPC server. pid:7.1 listen_address:[::]:443 service/service.go:7039
teleport  | 2025-11-03T12:39:27.633Z INFO [PROXY:SER] Starting TLS ALPN SNI proxy server on. pid:7.1 listen_address:[::]:443 service/service.go:5834
teleport  | 2025-11-03T12:39:31.637Z INFO [APP:SERVI] All applications successfully started. pid:7.1 service/service.go:6539
[...]
```