# Label-Studio on Openshift

Explore and demo label-studio on OpenShift

## Quick Start


Local Dev

```
# activate python virtual env (bash)
source venv/bin/activate

# start label-studio
label-studio
```

OpenShift

```
# create project for label-studio
oc new-project label-studio

# deploy all the things
oc apply -f openshift/dump
```

```
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name ocp-label-studio \
  --strategy source \
  --context-dir container
```

## Notes
- Not sure if this will run in offline mode
- Telemetry in logs makes me uncomfortable
- Improve microservice design
  - Avoid: building nginx in container
- Simplify container build
- Database REQUIRES postgres
- Address default data dir
  - Avoid: .local path for default

## TODO
- Use s2i source to build container

## Links
- https://github.com/heartexlabs/label-studio
- https://github.com/opendatahub-io-contrib/label-studio-integration