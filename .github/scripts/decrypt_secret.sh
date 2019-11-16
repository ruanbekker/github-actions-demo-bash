#!/bin/sh

# Decrypt the file
mkdir $HOME/secrets

# --batch to prevent interactive command --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="$GIT_SECRET" \
--output $HOME/secrets/my_secret.json $HOME/secrets/my_secret.json.gpg
