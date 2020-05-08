FROM oracle/graalvm-ce:20.0.0-java11 as builder

MAINTAINER Suresh
LABEL VM=Graal

WORKDIR /app
COPY . /app

RUN gu install native-image
RUN java -version && native-image --version
RUN ./native-image.sh

# https://github.com/GoogleContainerTools/distroless/blob/master/base/README.md
# FROM gcr.io/distroless/base

FROM gcr.io/distroless/static

COPY --from=builder /app/sample-app /app

ENTRYPOINT ["/app"]

