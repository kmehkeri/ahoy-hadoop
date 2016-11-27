# Ahoy Haoop!

Vagrant-based virtual cluster with Cloudera CDH5 components. It's a full-blown cluster of 5 (by default) nodes, not a standalone or pseudo-distributed crap :)

## What's included

- Hadoop base (HDFS, MapReduce, YARN)
- Zookeeper
- HBase
- Hive
- Hue

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

