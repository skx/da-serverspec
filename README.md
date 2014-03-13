
da-serverspec
=============

Some simple [serverspec](http://serverspec.org/) tests of the [Debian Administration](http://debian-administration.org/) cluster.


Usage
-----

First of all install the dependencies:

     bundle install --path ./gems

This will install:

* ServerSpec
     * The tool that does the testing.
* Rake
     * The ruby-based tool to run tasks/jobs.

Once both are installed you may launch the tests by executing:

     bundle exec rake spec

This should show zero failures, providing the cluster is working correctly.


Links
-----

This repository was created as a demonstration for my brief introduction to
serverspec:

* [A brief introduction to server-testing with serverspec](http://debian-administration.org/article/703/A_brief_introduction_to_server-testing_with_serverspec)



Steve
--
