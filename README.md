# Humio LDAP Configuration Testing

This project is used to generate the `humio/ldap-test` docker image that's used
to help determine what LDAP configuration settings you need to use when setting
up Humio for LDAP authentication. The contents include:

* `Dockerfile` - the docker build file
* `ldap-test.jar` - the compiled version of the [humio/ldap_test](https://github.com/humio/ldap_test) repo
* `.env.example` - an example environment file

While working with this, it's recommended to first get basic LDAP authentication
working. Once you have that working, then proceed with getting role-based
authorization working. Attempting to do both at once during initial
setup can complicate things unnecessarily.

## Getting Started

First, make sure you have [docker installed](https://www.docker.com/products/docker-desktop).
After you have that installed locally somewhere that has network access to your
LDAP directory service, pull the image:

```
docker pull humio/ldap-test
```

Next, create a `.env` file and add your LDAP configuration variable to it using
the [Humio LDAP authentication docs](https://docs.humio.com/configuration/authentication/ldap/)
for guidance. You can see an example at `.env.example`.

## Using the Image

Once your `.env` file is ready to test, simply run this command:

```
docker run -it --rm --env-file .env humio-ldap-test $USER $PASS
```

where `$USER` is the username of user you're attempting to authenticate with
and `$PASS` is its corresponding password.

After running this, you'll see output that should hopefully help you identify
where configuration issues might be happening. To make changes, just modify the
`.env` file and re-run the above command.

## Building the Image

This section is only needed if you're interested in building your own `ldap-test`
image for some reason. It's recommended that you use the `humio/ldap-test` image,
but you're welcome to build your own. There are no special steps required to
build the image, so simply running:

```
docker build -t my-ldap-test .
```

from the project directory will result in a new image named `my-ldap-test` being
built. You could then follow the same process as above to test with.

If you want to see the uncompiled form of `ldap-test.jar`, then point your
browser to the [humio/ldap_test](https://github.com/humio/ldap_test) repository.
