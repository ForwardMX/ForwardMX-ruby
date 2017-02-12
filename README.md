# ForwardMX

Manage [ForwardMX](https://ForwardMX.io) email forwarding and aliases in your Ruby applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ForwardMX'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ForwardMX

## Usage

```ruby
client = ForwardMX.new("API_KEY")

client.domains
client.aliases
client.create_domain "domain.tld"
client.create_alias "domain.tld", "test", "/dev/null"
client.update_alias "domain.tld", "test", "email@gmail.com"
client.destroy_alias "domain.tld", "test"
client.destroy_domain "domain.tld"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/b1nary/ForwardMX-ruby.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
