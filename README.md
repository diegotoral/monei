# Monei

[![Build Status](https://travis-ci.org/diegotoral/monei.svg?branch=master)](https://travis-ci.org/diegotoral/monei)[![Maintainability](https://api.codeclimate.com/v1/badges/22ad1031457106ec88ca/maintainability)](https://codeclimate.com/github/diegotoral/monei/maintainability)

`Monei` is a simple yet fun to play around Ruby gem for dealing with currencies and conversion rates at a high abstraction level. It's built on the concept of `Money` objects and convertion rates.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monei'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monei

## Usage

### Adding conversion rates

Add conversion rates to as many currencies do you want with `Money.conversion_rates`.

```ruby
Monei::Money.conversion_rates('EUR', {
  'USD' => 1.11,
  'Bitcoin' => 0.0047,
})
```

### Initialize Money objects

Create an instance of `Money` to start playing with it. It accepts two positional parameters, the first being the  amount and the latter the currency as a `string`, `symbol` or `Currency` instance.

```ruby
fifty_eur = Monei::Money.new(50, 'EUR')

fifty_eur.amount # => 50
fifty_eur.currency # => "EUR"
fifty_eur.inspect # => "50 EUR"
```

### Converting to a different currency

Use `Money#convert_to` to convert between currencies using the previously configured conversion rates.

```ruby
fifty_eur.convert_to('USD') # => "55.50 USD"
fifty_eur.convert_to('Bitcoin') # => "0.0235 Bitcoin"
```

### Money arithmetics

Mix and match `Money` instances and get new `Money` instances.

```ruby
twenty_dollars = Monei::Money.new(20, 'USD')

fifty_eur + twenty_dollars # => "68.02 EUR"
fifty_eur - twenty_dollars # => "31.98 EUR"
fifty_eur / 2 # => "25 EUR"
twenty_dollars * 3 # => "60 USD"
```

### Comparing money objects

Comparing `Money` is simple. It also handles different currencies.

```ruby
twenty_dollars == Monei::Money.new(20, 'USD') # => true
twenty_dollaers == Monei::Money.new(30, 'USD') # => false

fifty_eur_in_usd = fifty_eur.convert_to('USD')
fifty_eur_in_usd == fifty_eur # => true

twenty_dollars > Monei::Money.new(5, 'USD') # => true
twwenty_dollars < fifty_eur # => true
```

### Configuring precision

`Monei` allows you to set the precision when converting amount to `BigDecimal`.

```ruby
Monei.precision = 16
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/diegotoral/monei.
