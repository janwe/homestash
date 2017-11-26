source ~/.bashrc

if [[ "`uname`" == "CYGWIN"* ]]; then

  function keychain {
    if [[ -z ${1+x} ]]; then
      /usr/bin/keychain --agents ssh ~/.ssh/id_rsa
    else
      /usr/bin/keychain --agents ssh $1
    fi
  }

  keychain
  source ~/.keychain/*-sh
fi
