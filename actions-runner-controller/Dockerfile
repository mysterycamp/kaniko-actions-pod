FROM gcr.io/kaniko-project/executor:v1.6.0-debug as kaniko

FROM summerwind/actions-runner:v2.296.0-ubuntu-20.04
COPY --from=kaniko /kaniko /kaniko

USER 0
RUN mkdir runner
ENV DOCKER_CONFIG /kaniko/.docker

RUN chown -R runner:runner /kaniko
RUN chown -R runner:runner /runner
RUN chown runner:runner /bin
RUN chown runner:runner /usr/bin
RUN sed -i 's/\/root/\/home\/root/g' /etc/passwd

USER runner
ENV DOCKER_CONFIG /kaniko/.docker
RUN mkdir -p /home/runner/.docker
