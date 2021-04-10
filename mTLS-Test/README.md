Following instructions will help you test mutual TLS against Avi (NSX-ALB) load balancer.
Download mTLS-Certs.zip (Test Certificates are Self Signed and are valid till 2030)

Testing Instructions:

1. Download attached cert files and unzip certificates.
2. Create application certificate.
     2.1 On Avi controller, access Templates > Security > "SSL/ TLS Certificate" > Create > Application Certificate.
     2.2 Provide Name for certificate.
     2.3 Upload server.pem file under Certificates.
     2.4 Upload skey.pem file under Key (PEM).
     2.5 Validate and Save.
3. Create Intermediate certificate.
     3.1 On Avi controller, access Templates > Security > "SSL/ TLS Certificate" > Create > "Root/ Intermediate" Certificate.
     3.2 Provide Name for certificate.
     3.3 Upload intca.pem file under Certificates.
     3.4 Validate and Save.
4. Create root certificate.
     4.1 On Avi controller, access Templates > Security > "SSL/ TLS Certificate" > Create > "Root/ Intermediate" Certificate.
     4.2 Provide Name for certificate.
     4.3 Upload root-cert.pem file under Certificates.
     4.4 Validate and Save.
5. Create PKI Profile.
     5.1 On Avi controller, access Template > Security > "PKI Profile" > Create.
     5.2 Provide Name for PKI Profile.
     5.3 Uncheck "Enable CRL Check" for self signed certs.
     5.4 Select Add CA and upload chain.pem and click Add and then hit Save.
6. Create a new application profile.
     6.1 On Avi controller, access Templates > Profiles > Application > Create.
     6.2 Provide Name for Application Profile.
     6.3 Select HTTP and click on Security.
     6.4 Enable Client Certificate by clicking Require. (This knob makes sure client certificate is validated on load balancer)
     6.5 Attach PKI profile created in step 5.
     6.6 Save
7. Attach newly created certificate under Applications > Virtual Service > Application Profile and attach application certificate created in step 2 under Virtual Service > Certificate.
8. Copy client.pem, ckey.pem and chain.pem to the test client.
9. Add following entry to /etc/hosts/
        <VIP-IP>   www.vip.mtlstest.poc
10. Test mTLS:
   10.1. Positive Test: Run curl from client: curl https://www.vip.mtlstest.poc/ --cert client.pem --key ckey.pem --cacert chain.pem ==> Check if client gets 200 response. Check Virtual service logs to confirm mTLS validation.
   10.2. Negative Test: Run curl from client: curl https://www.vip.mtlstest.poc/ ==> Check if client gets 400 response. Check Virtual service logs to confirm Failed mTLS validation.
