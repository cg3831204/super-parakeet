# Coding skills challenge solution

## What is this?

See [the problem statement](https://github.com/tosumitagrawal/codingskills).

In short, we read in data from `input/` and write a merged catalog to `output/result_output.csv`.

### Assumptions

- A single company's catalog will not contain duplicate products
- No two different products share a barcode, i.e. any barcode is associated with only one product (which may appear in both catalogs)
  - I believe this is what is meant by:
    > If any supplier barcode matches for one product of company A with Company B then we can consider that those products as the same.
- When a product exists in both catalogs, we should use Company A's description
- We do not need to parse the supplier CSVs because we don't need to know anything about suppliers to produce a merged catalog
- If a CSV can be parsed and its header row is correct, we assume the rest of the CSV is valid
- The input CSVs will have referential integrity, e.g. there will not be an SKU in `catalogA.csv` which does not appear in `barcodesA.csv`
- The output does not need to be sorted in any particular way

## Setup

Tested on Fedora 35 Workstation and macOS Monterey 12.1

### Prerequisites

- Install [asdf](https://asdf-vm.com/guide/getting-started.html)
- Add [the asdf ruby plugin](https://github.com/asdf-vm/asdf-ruby)

### Steps

1. `asdf install` - installs the ruby version specified in `.tool-versions`
2. `gem install bundler` - installs [bundler](https://bundler.io/) which manages ruby dependencies (gems)
3. `bundle install` - installs the gems specified in `Gemfile.lock`

## Running the application

`bundle exec rake` - this will write to `output/result_output.csv`

## Running tests

`bundle exec rspec [path]`

### Examples
- `bundle exec rspec` - runs all tests
- `bundle exec rspec spec/main_spec.rb` - runs only `main_spec.rb`
