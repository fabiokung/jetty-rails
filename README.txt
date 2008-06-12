= jetty-rails

http://jetty-rails.rubyforge.net

== DESCRIPTION:

jetty_rails aims to run any Warbler based jruby on rails applications with Jetty Container, loading configuration from Warbler.

This project is useful for people developing jruby on rails apps that can not use mongrel for development. Rails applications integrated with servlet based applications in the same context would be a reasonable reason.

The project has born from my own needs. I needed to run JForum (http://jforum.net) on the same context of my jruby on rails application. I had also to integrate HttpSessions (avoiding single sign on) and use ServletContext in-memory cache store.

== FEATURES:

* Uses {JRuby Rack}[http://wiki.jruby.org/wiki/JRuby_Rack].
* Loads all jars inside your application lib/ dir, by default.
* Supports rails and merb applications out of the box.

== KNOWN ISSUES

* To generate coverage report with jruby (>= 1.1) follow instructions from http://www.ruby-forum.com/topic/146252 and run (inside jetty-rails root dir):
jruby -S rake rcov

* Hoe in jruby has an issue reading the ~/.hoerc file. Just remove it.

== USAGE:

=== Rails:

  cd myrailsapp
  jruby -S jetty_rails
  
help option shows usage details:
  
  jruby -S jetty_rails --help

=== Merb:

  cd mymerbapp
  jruby -S jetty_merb

help option shows usage details:

  jruby -S jetty_merb --help

== Multiple Servers

You can specify a configuration yaml file rather than command line switches. 
The file also allows specifying multiple servers and / or application contexts for single jetty container.

For example, you could set a context_path of /testA on port 8888 which is rails, /testB also that port which is merb.
Or, you could have /testA on port 8888 and /testB on port 9999.

=== Rails:

If -c is not specified, by default jetty_rails will look for a config/jetty_rails.yml relative to where it is started.

Don't forget to add this into your config/environment.rb
ActionController::AbstractRequest.relative_url_root = "/testA"


== REQUIREMENTS:

jetty-rails requires jruby (>=1.1). Please make sure you already have 
it properly installed and inserted in your PATH environment variable.

{Installing JRuby Instructions}[http://wiki.jruby.org/wiki/Getting_Started]

== INSTALL:

  jruby -S gem install jetty-rails

== LICENSE:

Jetty Rails is distributed under the terms of The MIT License.
Copyright (c) 2008 Fabio Kung <fabio.kung@gmail.com>
  
Read more details in the bundled +Licenses.txt+ file. There are other 
pieces of software bundled with jetty-rails. Before using jetty-rails, 
make sure you agree with all of them.
