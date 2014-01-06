# setup

1. `vagrant up`
2. `vagrant hostmanager`
3. Enable web on both machines: `rabbitmq-plugins enable rabbitmq_management` then
restart the service: `sudo service rabbitmq-server restart`
4. Make sure the `/var/lib/rabbitmq/.erlang.cookie` is same on both machines
5. Cluster from queue02:
   1. `sudo rabbitmqctl stop_app`
   2. `sudo rabbitmqctl join_cluster rabbit@queue01`
6. Setup the HA policy: `sudo rabbitmqctl set_policy ha-all "^events\." '{"ha-mode":"all"}'`
