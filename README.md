# central-sre-infra
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This repo contains the code we use to configure our aws accounts' infrastructure. We manage sharing code across tf backends in different accounts with the _main module pattern_. This lets us reuse our tf code across multiple environments & backends with a minimal amount of duplication.

## Usage

Run terraform from the `environments/$ENV` folders. Variables should go inside an `$ENV.auto.tfvars` file per folder. 
See [example variables](./examples/example-variables.md) for more info.

## Caveats

For now this code will just deploy an s3 server access logs logging bucket to each environment as a Service Catalog provisioned product sourced from a manually-created SC portfolio.

Once we have a legit SC in place we should consider the best approach for each piece (separate modules or files, optional/environment-specific pieces and so on). 



## Licence
[MIT License](LICENSE)
