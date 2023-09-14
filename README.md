# Label-Studio on Openshift

Explore and demo label-studio on OpenShift

## Usage

### Quick Start

See [Label Studio Helm Chart](https://github.com/HumanSignal/charts) with [OpenShift Values](https://github.com/HumanSignal/charts/blob/master/heartex/label-studio/example-values/label-studio-on-openshift.yaml)

```
. scripts/bootstrap.sh

# local demo
local_demo

# openshift demo
openshift_demo
```

Import local files via `files.txt`

```
scripts/serve_local_files.sh path_to_files/*.png
```

Import from YOLO format to label studio

```
mkdir -p scratch/example
cd scratch/example

unzip yolo.zip -d example

label-studio-converter import yolo \
  -i example/ \
  -o ls-tasks.json \
  --image-ext .jpg \
  --image-root-url http://localhost:8081

cd ../..

scripts/serve_local_files.sh scratch/example/images
```

Create a Label Studio Project via cli

```
label-studio init Example \
  --initial-project-description "An Example Project" \
  --label-config ls-tasks.label_config.xml
```

### TL;DR Example

```
# create project for label-studio
oc new-project label-studio

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

- [Label Studio - Getting Started](https://labelstud.io/guide/start.html)
- [Label Studio - Import data (cli)](https://labelstud.io/guide/tasks#Import-data-from-the-command-line)
- [Label Studio - Import Conversion Tool](https://github.com/HumanSignal/label-studio-converter)
- [Official Label Studio Helm Chart - Values for OpenShift](https://github.com/HumanSignal/charts/blob/master/heartex/label-studio/example-values/label-studio-on-openshift.yaml)
- [GitHub - Label Studio](https://github.com/heartexlabs/label-studio)
- [Demo: Label Studio on OpenShift](https://github.com/rh-intelligent-application-practice/labelstudio-openshift-deploy)
- [atef23/labelstudio-openshift-deploy](https://github.com/atef23/labelstudio-openshift-deploy)
- [opendatahub-io-contrib/label-studio](https://github.com/opendatahub-io-contrib/label-studio-integration) - NOT working
- [Review / To Do](REVIEW.md)

## MLOps CoP Links

- [Label Studio - Presentation](https://docs.google.com/presentation/d/1bH-JYQmxIkxlug6N6yDqojKDC7XVE7HD5uxyZ7VEO-s)
- [Label Studio - Recording](https://drive.google.com/file/d/1USf9kzuAIjviqeB6f56c4SGIyMmXovkT/)
