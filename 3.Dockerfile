#syntax=docker/dockerfile-upstream:1.4.0-rc1
FROM scratch
COPY --from=local1 local1 local1
COPY --from=local2 local2 local2
