#!/usr/bin/env bash

main() {
  if [[ $# -ne 2 ]]; then
    printf 'usage: domain organization\n' >&2
    return 1
  fi

  local domain="$1"
  local organization="$2"
  local password
  password=$(openssl rand -hex 16)
  printf 'Generated password: %s\n' "${password}"

  cat << EOF | debconf-set-selections
slapd slapd/domain string ${domain}
slapd shared/organization string ${organization}
slapd slapd/backend string MDB
slapd slapd/password2 password ${password}
slapd slapd/password1 password ${password}
EOF

  dpkg-reconfigure -f noninteractive slapd

  ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts
  ldapwhoami -H ldap:// -x
}

main "$@"
