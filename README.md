# Coding skills challenge solution

## What is this?

See [the problem statement](https://github.com/tosumitagrawal/codingskills).

In short, we read in data from `input/` and write a merged catalog to `output/result_output.csv`.

### Assumptions

- A single company's catalog will not contain duplicate products
- When a product exists in both catalogs, we should use Company A's description
- We do not need to parse the supplier CSVs because they are not required to produce the correct output
- Input CSVs are valid

## Setup

### Prerequisites

- Install [asdf](https://asdf-vm.com/guide/getting-started.html)
- Add [the asdf ruby plugin](https://github.com/asdf-vm/asdf-ruby)

### Steps

1. `asdf install` - installs the ruby version specified in .tool-versions
2. `gem install bundler` - installs [bundler](https://bundler.io/) which manages ruby dependencies (gems)
3. `bundle install` - installs the gems specified in Gemfile.lock

## Running the application

`bundle exec rake`

## Running tests

`bundle exec rake test`
