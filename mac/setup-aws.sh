#!/usr/bin/env bash

echo
echo "Installing AWS stuff..."
aws=(
    awscli
    ec2-api-tools
    aws-elasticbeanstalk
    sshuttle
)
for a_brew in ${aws[@]}; do
    brew install $a_brew
done

echo
echo "Done with AWS stuff!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor
