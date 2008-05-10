= jetty-rails

jetty-rails.rubyforge.net

== DESCRIPTION:

jetty_rails aims to run any Warbler based jruby on rails applications with Jetty Container, loading configuration from Warbler.

This project is useful for people developing jruby on rails apps that can not use mongrel for development. Rails applications integrated with servlet based applications in the same context would be a reasonable reason.

The project has born from my own needs. I needed to run JForum (http://jforum.net) on the same context of my jruby on rails application. I wanted to integrate HttpSessions (avoiding single sign on) and use ServletContext in-memory cache store.

== FEATURES/PROBLEMS:

* FIX (list of features or problems)

== SYNOPSIS:

* FIX (code sample of usage)

== REQUIREMENTS:

* FIX (list of requirements)

* To generate coverage report with jruby (>= 1.1) follow 
http://www.ruby-forum.com/topic/146252 and:

jruby -S rake rcov

== INSTALL:

* FIX (sudo gem install, anything else)

== LICENSE:

Jetty Rails is distributed under the terms of The MIT License.

  Copyright (c) 2008 Fabio Kung <fabio.kung@gmail.com>
  
Read more details in the bundled Licenses.txt file. There are other 
pieces of software bundled with jetty-rails. Before using jetty-rails, 
make sure you agree with all of them.
