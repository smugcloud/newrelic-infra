FROM centos:7

ADD newrelic-infra.repo /etc/yum.repos.d/

RUN yum makecache fast && \
  yum -y install newrelic-infra dmidecode policycoreutils ca-certificates && \
  yum clean all

ADD newrelic-infra.yml /etc/

# Set log level to a sane default
ENV NRIA_LOGLEVEL="info"
ENV NRIA_VERBOSE=0

# This assumes you mount the host ROOT directory read-only
# inside the container at /mnt/ROOT
ENV NRIA_OVERRIDE_HOST_ROOT="/mnt/ROOT"

ADD entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]