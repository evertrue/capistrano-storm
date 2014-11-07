# Capistrano::Storm

This gem provides support in Capistrano 3.x for handling the deployment of a Storm Topology.

Plays nicely with [capistrano-scm-jenkins](https://github.com/lidaobing/capistrano-scm-jenkins).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-storm'
```

And then execute:

```bash
$ bundle
```

## Usage

This Gem requires that your deploy user have *passwordless sudo rights* to run
`storm kill` and `storm jar`. See [Capistrano’s Authorisation docs](http://capistranorb.com/documentation/getting-started/authentication-and-authorisation/#toc_8)
for a simple example.

In `Capfile`:
```ruby
require 'capistrano-storm/storm'
```

In your `config/deploy.rb`:

```ruby
# Storm Topology to deploy from the current_path
set :deployed_artifact_filename, 'storm-topology.jar'

set :topology_class_name, 'com.et.contacts.storm.topology.ContactNotifyTopology'
set :topology_name, 'contact-change'
set :topology_args, '5 4 4 5'
```

## Contributing

1. Fork it ( http://github.com/evertrue/capistrano-storm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
