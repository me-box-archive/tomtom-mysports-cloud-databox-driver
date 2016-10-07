# TomTom Runner Databox Driver
> Databox driver for the TomTom Runner/Spark series of watches.

A databox driver for the TomTom Runner/Spark series of watches. Currently
in development

## Installation

TBC.

## Development setup

There are two routes available to development. The first is via 
[Vagrant](https://www.vagrantup.com/) which will set up a complete development
environment. Once you have the vagrant box up and running, you can build
the Docker container by running ``make`` in the ``/vagrant`` directory in the
box.

If you do not wish to use Vagrant, you will need the following installed:
* GNU Make
* [Docker](https://www.docker.com/)
* [OPAM](https://opam.ocaml.org/) with OCaml 4.03.0 or greater
* [OASIS](http://oasis.forge.ocamlcore.org/) (available through OPAM)
You are then able to run ``make`` to build the Docker container. 

## Meta

Distributed under the ISC license. See ``LICENSE`` for more information.

Third Party Component Licenses:
* ``tinycore/docker.tcz`` contains software from [Docker](https://www.docker.com/)
licensed under the [Apache 2.0 License](https://github.com/docker/docker/blob/master/LICENSE).
* ``tinycore/iptables.tcz`` contains software from [Netfilter](https://www.netfilter.org/)
licensed under the [GNU GPLv2 License](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).
* ``tinycore/opam.tcz`` contains software from [OPAM](https://opam.ocaml.org/)
licensed under the [GNU LGPLv2.1 License](https://github.com/ocaml/opam/blob/master/LICENSE).



[https://github.com/me-box/tomtom-runner-databox-driver](https://github.com/me-box/tomtom-runner-databox-driver)