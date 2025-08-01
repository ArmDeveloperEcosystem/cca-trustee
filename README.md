
This repository contains configuration files used for starting Trustee services
docker containers with CCA attestation support.

For detailed usage instructions please see
["Run an end-to-end Attestation with Arm CCA and Trustee"](https://learn.arm.com/learning-paths/servers-and-cloud-computing/cca-trustee)
Learning Path

The config files are based on the recommended configurations from
[Trustee source repository](https://github.com/confidential-containers/trustee)

```
${TRUSTEE_SRC}/docker-compose.yml
${TRUSTEE_SRC}/kbs/config/rvps.json
${TRUSTEE_SRC}/kbs/config/docker-compose/kbs-config.toml
${TRUSTEE_SRC}/deps/verifier/test_data/cca/conf/cca-config-remote.json
${TRUSTEE_SRC}/deps/verifier/test_data/cca/conf/as-config.json
```
