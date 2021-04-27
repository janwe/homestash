#!/usr/bin/env bash

echo
echo "Installing java stuff..."

brew tap adoptopenjdk/openjdk

javastuff=(
    jenv
    #adoptopenjdk here
    #java8 not anymore
    #java not anymore
    maven
    gradle
)
for a_brew in ${javastuff[@]}; do
    brew install $a_brew
done

echo
echo "Adding JVM langs..."
#JVM Langs
langs=(
    scalaenv
    scala
    sbtenv
    sbt
    kotlin
)
for a_brew in ${langs[@]}; do
    brew install $a_brew
done

echo
echo "Done with java stuff!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor
