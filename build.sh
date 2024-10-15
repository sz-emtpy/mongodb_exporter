docker buildx build --builder default -t mongodb_exporter_x86:0.30.0 --platform linux/amd64 . --load

docker buildx build --builder default -t mongodb_exporter_arm64:0.30.0 --platform linux/arm64 . --load