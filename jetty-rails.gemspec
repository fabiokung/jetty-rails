(in /Users/fck/Development/Ruby/Apps/jetty-rails)
Gem::Specification.new do |s|
  s.name = %q{jetty-rails}
  s.version = "0.1"
  s.platform = %q{java}

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fabio Kung"]
  s.date = %q{2008-05-04}
  s.default_executable = %q{jetty_rails}
  s.description = %q{description of gem}
  s.email = ["fabio.kung@gmail.com"]
  s.executables = ["jetty_rails"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "bin/jetty_rails", "config/hoe.rb", "config/requirements.rb", "lib/jetty-6.1.9.jar", "lib/jetty-plus-6.1.9.jar", "lib/jetty-util-6.1.9.jar", "lib/jetty_rails.rb", "lib/jetty_rails/jars.rb", "lib/jetty_rails/runner.rb", "lib/jetty_rails/version.rb", "lib/jruby-rack-1.0-SNAPSHOT.jar", "lib/servlet-api-2.5-6.1.9.jar", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "spec/jetty_rails/runner_spec.rb", "spec/jetty_rails_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/rspec.rake", "tasks/website.rake", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://jetty-rails.rubyforge.org}
  s.post_install_message = %q{
For more information on jetty-rails, see http://jetty-rails.rubyforge.org
}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{jetty-rails}
  s.rubygems_version = %q{1.0.1}
  s.summary = %q{description of gem}
  s.test_files = ["spec/jetty_rails/runner_spec.rb", "spec/jetty_rails_spec.rb"]
end
