FROM gcr.io/kaniko-project/executor:v1.6.0-debug as kaniko
FROM ubuntu

ENV RUNNER_VERSION=2.285.0
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y curl sudo

# Install runner
RUN mkdir actions-runner
WORKDIR actions-runner

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN ./bin/installdependencies.sh

RUN adduser runner
RUN usermod -aG sudo runner
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chown -R runner:runner /actions-runner
RUN chmod -R 744 /actions-runner

ADD entrypoint.sh ./
RUN chmod +x entrypoint.sh

# Initialize kaniko within container
COPY --from=kaniko /kaniko /kaniko

RUN chown -R runner:runner /kaniko
RUN chown runner:runner /bin
RUN chown runner:runner /usr/bin
RUN sed -i 's/\/root/\/home\/root/g' /etc/passwd

USER runner

ENV DOCKER_CONFIG /kaniko/.docker
RUN mkdir -p /home/runner/.docker

ENTRYPOINT ["bash", "/actions-runner/entrypoint.sh"]
