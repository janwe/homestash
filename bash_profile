if [[ "`uname`" == "CYGWIN"* ]]; then

  function keychain {
    if [[ -z ${1+x} ]]; then
      /usr/bin/keychain ~/.ssh/id_rsa
    else
      /usr/bin/keychain $1
    fi
  }

  keychain
  source ~/.keychain/*-sh
fi

source ~/.bashrc
