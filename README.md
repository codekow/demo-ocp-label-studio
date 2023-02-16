# Label-Studio on Openshift

Explore and demo label-studio on OpenShift

## Usage


### Quick Start

```
# create project for label-studio
oc new-project label-studio-source

APP_NAME=label-studio-patch
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy docker \
  --context-dir container/patch

oc expose service \
  "${APP_NAME}" \
  --port 8080 \
  --overrides='{"spec":{"tls":{"termination":"edge"}}}'
```

### Local Dev

```
# activate python virtual env (bash)
source venv/bin/activate

# start label-studio
label-studio
```

### OpenShift

New Project for testing

```
# create project for label-studio
oc new-project label-studio-source
```

Source to Image (s2i): strategy `docker` to [patch](container/patch) public image

```
APP_NAME=label-studio-patch
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy docker \
  --context-dir container/patch
```

Source to Image (s2i): strategy `source`

```
APP_NAME=label-studio-s2i-source
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy source \
  --context-dir container/s2i
```

Source to Image (s2i): strategy `docker`

```
APP_NAME=label-studio-s2i-docker
oc new-app https://github.com/redhat-na-ssa/demo-ocp-label-studio.git \
  --name "${APP_NAME}" \
  --strategy docker \
  --context-dir container/s2i
```

Expose via route in OpenShift (repeat as needed)

```
oc expose service \
  "${APP_NAME}" \
  --port 8080 \
  --overrides='{"spec":{"tls":{"termination":"edge"}}}'
  ```

## Links
- [Review / To Do](REVIEW.md)
- [GitHub - Label Studio](https://github.com/heartexlabs/label-studio)
- [Demo: Label Studio on OpenShift](https://github.com/rh-intelligent-application-practice/labelstudio-openshift-deploy)
- [atef23/labelstudio-openshift-deploy](https://github.com/atef23/labelstudio-openshift-deploy)
- [opendatahub-io-contrib/label-studio](https://github.com/opendatahub-io-contrib/label-studio-integration) - NOT working

## MLOps CoP Links
- [Label Studio - Presentation](https://docs.google.com/presentation/d/1bH-JYQmxIkxlug6N6yDqojKDC7XVE7HD5uxyZ7VEO-s)
- [Label Studio - Recording](https://drive.google.com/file/d/1USf9kzuAIjviqeB6f56c4SGIyMmXovkT/)
