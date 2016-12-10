# Ahoy Haoop!

Vagrant-based virtual cluster with Cloudera CDH5 components. It's a full-blown cluster of 5 (by default) nodes, not a standalone or pseudo-distributed crap :)

## What's included

- Hadoop base (HDFS, MapReduce, YARN)
- Zookeeper
- HBase
- Hive
- Oozie
- Hue
- Spark
- Sqoop

Note it does NOT include Cloudera Manager.

## Requirements

- Git
- Vagrant
- vagrant-cachier plugin (optional, but makes setup a lot faster)
- Ansible

## Installation

    $ git clone https://github.com/kmehkeri/ahoy-hadoop.git
    $ cd ahoy-hadoop
    $ vagrant up
			    
Before calling vagrant you may edit Vagrantfile and adjust number of nodes and their parameters (memory & cpus).

## Usage

Use `vagrant ssh` to connect to `node0`. Or target specific node with `vagrant ssh nodeX`.

Web interfaces exposed via port forwarding:
- `http://localhost:50070` - NameNode
- `http://localhost:8088` - Resource Manager
- `http://localhost:8888` - Hue

Password is `vagrant` for all OS/db/web accounts.

## Infrastructure details

`node0` runs master daemons of HDFS, YARN, HBase, Hive and Oozie. It also runs Hue and contains client tools for Sqoop and Spark.

`node1` runs Secondary NameNode.

`node0`, `node1` and `node2` form Zookeeper ensemble.

All nodes, including ones mentioned above are worker nodes of HDFS, YARN and HBase.

Nodes communicate via Host-only network. IPs are `192.168.33.1X`, where X is node's number.
