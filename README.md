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
oc new-project label-studio-source

APP_NAME=ocp-label-studio
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy source \
  --context-dir container/s2i

oc expose svc "${APP_NAME}"
```

```
APP_NAME=ocp-label-studio-docker
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy docker \
  --context-dir container/s2i
```

```
APP_NAME=ocp-label-studio-patch
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy docker \
  --context-dir container/patch
```


## Links
- https://github.com/heartexlabs/label-studio
- https://github.com/opendatahub-io-contrib/label-studio-integration