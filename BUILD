load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")
load("@bazel_gazelle//:def.bzl", "gazelle")

gazelle(
    name = "gazelle",
    prefix = "github.com/orangesys/slack8s",
)

go_library(
    name = "go_default_library",
    srcs = ["main.go"],
    importpath = "github.com/orangesys/slack8s",
    visibility = ["//visibility:private"],
    deps = ["@com_github_nlopes_slack//:go_default_library"],
)

go_binary(
    name = "slack8s",
    embed = [":go_default_library"],
    importpath = "github.com/orangesys/slack8s",
    visibility = ["//visibility:public"],
)

load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_image(
    name = "image",
    embed = [":go_default_library"],
    importpath = "github.com/orangesys/slack8s",
    visibility = ["//visibility:public"],
)

# push container to ecr
load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_push",
    "container_bundle",
)

container_push(
  name = "publish",

  format = "Docker",
  image = ":image",
  # Any of these components may have variables.
  registry = "index.docker.io",
  repository = "orangesys//slack8s",
  tag = "{STABLE_BUILD_GIT_TAG}",

  # Trigger stamping.
  stamp = True,
)

container_bundle(
    name = "bundle_to_push",
    images = {
        "asia.gcr.io/saas-orangesys-io/slack8s:{STABLE_BUILD_GIT_TAG}": ":image",
        "asia.gcr.io/saas-orangesys-io/slack8s:latest": ":image",
    },
    stamp = True,
)

load(
    "@io_bazel_rules_docker//contrib:push-all.bzl",
    docker_pushall = "docker_push",
)

docker_pushall(
    name = "push_bundle",
    bundle = ":bundle_to_push",
)