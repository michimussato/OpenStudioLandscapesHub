

Issues

```
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