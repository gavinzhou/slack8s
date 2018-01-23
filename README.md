[![](https://images.microbadger.com/badges/image/orangesys/alpine-slack8s.svg)](https://microbadger.com/images/orangesys/alpine-slack8s "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/orangesys/alpine-slack8s.svg)](https://microbadger.com/images/orangesys/alpine-slack8s "Get your own version badge on microbadger.com")
# Kubernetes Events Slack Bot (slack8s)

Kubernetes Slack Integration - Infinite loop go program which queries the Kubernetes Event Stream API and
posts messages to slack for important events.

![Slack8s demo showing creation of pod and then failed backoff loop alerts via Slack.](images/slack8s-demo.png)

## Building

Use [bazel](https://bazel.build/) build.

```bash
bazel build :slack8s
```

## Build container image

```bash
bazel run :image 
```

## Running

Use [Helm](https://github.com/kubernetes/helm) deploy [charts](https://github.com/orangesys/charts) to k8s.