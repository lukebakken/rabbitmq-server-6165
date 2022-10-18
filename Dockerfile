FROM rabbitmq:3-management-alpine

COPY --chown=rabbitmq:rabbitmq --chmod=0400 erlang.cookie /var/lib/rabbitmq/.erlang.cookie
COPY --chown=rabbitmq:rabbitmq --chmod=0400 tls-gen/basic/result/ca_certificate.pem /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq --chmod=0400 tls-gen/basic/result/server_rabbitmq_certificate.pem /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq --chmod=0400 tls-gen/basic/result/server_rabbitmq_key.pem /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq enabled_plugins /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

EXPOSE 4369 5671 5672 15671 15672 15692 25672 35672-35682
