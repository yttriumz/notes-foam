# Crypto

Last modified: 2023/11/22 17:26:49

## PKCS12

- `keytool`
  - Show certificates in the keystore: `keytool -list -v -keystore KEYSTORE_PATH -storepass KEYSTORE_PASSWORD -storetype PKCS12`
  - Delete a certificate in the keystore: `keytool -delete -alias ALIAS_NAME -keystore KEYSTORE_PATH -storepass KEYSTORE_PASSWORD -storetype PKCS12`
  - Import a certificate to the keystore: `keytool -importcert -alias ALIAS_NAME -keystore KEYSTORE_PATH -storepass KEYSTORE_PASSWORD -storetype PKCS12 -trustcacerts -file CERTIFICATE_PATH`
- `openssl`
  - Show certificates in the keystore with `-legacy` option: `openssl pkcs12 -info -legacy -nokeys -in KEYSTORE_PATH -passin "pass:KEYSTORE_PASSWORD"`
  - Create/overwrite a keystore with `-legacy` option: `openssl pkcs12 -export -legacy -inkey PRIVATE_KEY -in CERTIFICATE_PATH -name ALIAS_NAME -out KEYSTORE_PATH -passout "pass:KEYSTORE_PASSWORD"`

*References*:

- [The keytool Command](https://docs.oracle.com/en/java/javase/17/docs/specs/man/keytool.html)
- [/docs/man3.0/man1/openssl-pkcs12.html](https://www.openssl.org/docs/man3.0/man1/openssl-pkcs12.html)
- [How to verify the password of a pkcs#12 certificate (.PXF) with openssl C API? - Stack Overflow](https://stackoverflow.com/questions/4678730/how-to-verify-the-password-of-a-pkcs12-certificate-pxf-with-openssl-c-api)
- [encryption - verfiy password for a PKCS#12 file - Stack Overflow](https://stackoverflow.com/questions/70857676/verfiy-password-for-a-pkcs12-file)
- [openssl - Convert an old style .p12 to .pem (unsupported algorithm RC2-40-CBC) - Stack Overflow](https://stackoverflow.com/questions/72859711/convert-an-old-style-p12-to-pem-unsupported-algorithm-rc2-40-cbc)
- [FreeKB - OpenSSL - Display the contents of a PKCS12 file](https://www.freekb.net/Article?id=2460)
- [How to list the certificates stored in a PKCS12 keystore with keytool? - Stack Overflow](https://stackoverflow.com/questions/14375235/how-to-list-the-certificates-stored-in-a-pkcs12-keystore-with-keytool)
- [How to create a certificate into a PKCS12 keystore with keytool? - Stack Overflow](https://stackoverflow.com/questions/14375185/how-to-create-a-certificate-into-a-pkcs12-keystore-with-keytool)
- [How to update an expired certificate in the existing keystore? | SmartBear Software](https://support.smartbear.com/collaborator/faq/how-to-update-an-expired-certificate-in-the-existi/)
- [tomcat - keytool error: java.lang.Exception: Failed to establish chain from reply - Stack Overflow](https://stackoverflow.com/questions/23611688/keytool-error-java-lang-exception-failed-to-establish-chain-from-reply)
- [openssl - How to Import CA cert to pkcs12 - Super User](https://superuser.com/questions/433236/how-to-import-ca-cert-to-pkcs12)
- [x509certificate - Load multiple certificates into PKCS12 with openssl - Stack Overflow](https://stackoverflow.com/questions/19704950/load-multiple-certificates-into-pkcs12-with-openssl)
- [java keystore pkcs12 legacy - Mister PKI](https://www.misterpki.com/java-keystore-pkcs12-legacy/)
- [openssl pkcs12 legacy - Mister PKI](https://www.misterpki.com/openssl-pkcs12-legacy/)
- [\[JDK-8228481\] Upgrade the default PKCS12 encryption/MAC algorithms - Java Bug System](https://bugs.openjdk.org/browse/JDK-8228481)
- [ssl - IOException in Java 8 when reading PKCS12 keystore created with keytool from OpenJDK16 - Stack Overflow](https://stackoverflow.com/questions/67766268/ioexception-in-java-8-when-reading-pkcs12-keystore-created-with-keytool-from-ope)

## PEM

- Show expiration date: `openssl x509 -enddate -noout -in PEM_PATH`

*References*:

- [linux - How to determine SSL cert expiration date from a PEM encoded certificate? - Stack Overflow](https://stackoverflow.com/questions/21297853/how-to-determine-ssl-cert-expiration-date-from-a-pem-encoded-certificate)
