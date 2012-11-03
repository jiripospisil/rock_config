# RockConfig [![Build Status](https://secure.travis-ci.org/mekishizufu/rock_config.png)](http://travis-ci.org/mekishizufu/rock_config) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/mekishizufu/rock_config)

RockConfig is a simple convention based library for reading and accessing config files.

## Installation

Add this line to your application's Gemfile:

    gem "rock_config"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rock_config

## Usage

Given the file elastic_search.yml:

    development:
      host: 127.0.0.1
      port: 9200

    production:
      host: 192.168.1.10
      port: 9200

RockConfig allows you to read these settings with an API like this:

    elastic_config = RockConfig.for "elastic_search"
    elastic_config.host # > 127.0.0.1

RockConfig automatically chooses the current application environment. You select the environment yourself
with: 

    RockConfig.for "elastic_search", "production"

RockConfig scans predefined directories for config files. By default, it tries to scan directory
`config` in the project root. You can add more directories:

    RockConfig.configure do |config|
      config.scanned_directories << "custom_path"
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
