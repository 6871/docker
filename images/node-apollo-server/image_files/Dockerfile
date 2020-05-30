# Build image with nodejs; specify versions with, e.g.:
# --build-arg from_image=node:latest
# --build-arg graphql_version=@14

ARG from_image
FROM ${from_image}

ARG graphql_version

RUN npm init --yes \
    && npm install graphql \
    && npm install apollo-server graphql pg
