#syntax=docker/dockerfile-upstream:1.4.0-rc1
FROM scratch
COPY --from=1local local1 local1
COPY --from=2local local2 local2
