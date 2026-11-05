# Stacksmith platform example

This repository owns a `private_bucket` component and its AWS implementation. The application repository selects the component without authoring Terraform resources. Public access is blocked by the module, rather than an optional application input.

Use this with [the application example](https://github.com/ci-sourcerer/stacksmith-example-app). The application pins this configuration to a commit. Review a configuration change here, then deliberately update that pin in the application repository.

The module creates an empty S3 bucket in `us-east-1`. It does not force-delete objects. Empty the bucket before destroying it. Remote state belongs in a separate bootstrap bucket and must outlive the application resources.
