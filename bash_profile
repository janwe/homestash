if [[ "`uname`" == "CYGWIN"* ]]; then
  if [ -z ${1+x} ]; then
    keychain ~/.ssh/id_rsa
  else
    keychain $1
  fi
fi
source ~/.bashrc
