# Minio complete Guide [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## How to Run Minio?

[Minio Quickstart Guide](https://docs.minio.io/docs/minio-quickstart-guide)

[Minio Docker Quickstart Guide](https://docs.minio.io/docs/minio-docker-quickstart-guide)

[Minio Erasure Code Quickstart Guide](https://docs.minio.io/docs/minio-erasure-code-quickstart-guide)

### CLI Flags

```sh
$ minio
NAME:
  Minio - Cloud Storage Server.

DESCRIPTION:
  Minio is an Amazon S3 compatible object storage server. Use it to store photos, videos, VMs, containers, log files, or any blob of data as objects.

USAGE:
  minio [flags] command [arguments...]

COMMANDS:
  server	Start object storage server.
  version	Print version.
  update	Check for a new software update.
  
FLAGS:
  --help, -h					Show help.
  --config-dir, -C "/Users/koolhead17/.minio"	Path to configuration folder.
  --quiet					Suppress chatty output.
  
VERSION:
  DEVELOPMENT.GOGET

```

### Env Variables
Setup to environment variable?

### Configuration
Default caching disable?

### Set up certificates
 
[Generate Let's Encrypt certificate using Concert for Minio](https://docs.minio.io/docs/generate-let-s-encypt-certificate-using-concert-for-minio)

Self signed certs with Caddy in front?
