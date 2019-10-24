Installs OpenLDAP on the specified base image; for prototyping, not
production.

Build arguments:

--build-arg | Description | Example Value
--- | --- | ---
from_image | Docker image for Dockerfile's FROM clause | ubuntu:19.10

---

- https://www.openldap.org/
- https://help.ubuntu.com/lts/serverguide/openldap-server.html
  - https://help.ubuntu.com/community/OpenLDAPServer
- [LDAP System Administration](https://learning.oreilly.com/library/view/ldap-system-administration/1565924916/)

---
To run an ```openldap``` container in the background, not yet running
```slapd```:

```shell script
docker run --detach --interactive --tty --name openldap --publish 389:389 openldap
```

To start slapd (https://www.openldap.org/doc/admin24/runningslapd.html):
```shell script
# Without -d, slapd automatically runs in the background
docker exec openldap slapd

# Or to start with debugging and log to file:
docker exec openldap bash -c 'slapd -d -1 &> /root/slapd.log &'
```

To see slapd pid:
```shell script
docker exec openldap pgrep -x slapd
docker exec openldap ps -ef
```

To stop slapd:
```shell script
# bash -c and single quotes so $() is not evaluated by container host's shell
docker exec openldap bash -c 'kill -9 $(pgrep -x slapd)'
```

To run some example ldap commands in the container:
```shell script
docker exec openldap ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts
docker exec openldap ldapwhoami -H ldap:// -x
```

To run ```ldapsearch``` on the container host against the container's
```slapd``` service:
```shell script
ldapsearch -h localhost -p 389 -x -b '' -s base '(objectclass=*)' namingContexts
```

To run [```reconfigure.sh```](image_files/reconfigure.sh) to setup an example
domain and organization; script will output a new generated password:
```shell script
# if slapd running
docker exec openldap bash -c 'kill -9 $(pgrep -x slapd)'

docker exec openldap reconfigure.sh example.com "Example Org"
docker exec openldap slapd
docker exec openldap ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts
```

One way to load LDAP config ([example.ldif](example.ldif) is from https://help.ubuntu.com/lts/serverguide/openldap-server.html):
```shell script
docker cp example.ldif openldap:/root
docker exec --tty --interactive openldap ldapadd -x -D cn=admin,dc=example,dc=com -W -f /root/example.ldif
docker exec openldap ldapsearch -x -LLL -b dc=example,dc=com 'uid=john' cn gidNumber
```

To attach to the container:
```shell script
# Use CTRL-p CTRL-q to detach; exit stops container
docker attach openldap
```

To remove the container:
```shell script
docker rm -fv openldap
```

