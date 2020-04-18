# Overview

The `pgaertig/letsencrypt` image will:

  * Automatically create or renew certificates on startup and daily thereafter.

  * Combine private keys and their full certificate chain for HAproxy.

  * Support ACME v2 and HTTP-01 protocol.

# Usage

In your `letsencrypt` service:

  * Define a `DOMAINS` environment variable. Certificates are separated by
    newline or semi-colon (`;`) and domains are separated by comma (`,`).

    **NOTE:** Let's Encrypt has a limit of 20 certificates per registered
    domain per week, and 100 names per certificate. You should combine
    subdomains into a single certificate, wherever possible.

    See: https://letsencrypt.org/docs/rate-limits/

  * Define an `EMAIL` environment variable. It will be used for all
    certificates.

  * Define an `OPTIONS` environment variable, if you want to pass additional
    arguments to `certbot` (e.g. `--staging`).

Sample compose and stack files are provided, including a wildcard self signed
default certificate.
