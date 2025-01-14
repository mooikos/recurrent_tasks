# Recurrent Tasks

A gem that uses that fetches recurrent tasks jsons in "rspec" verify their manual regularity execution

## Usage

Include the gem in your rspec `spec_helper.rb` to declare the specs (location should not matter).
```
# spec/spec_helper.rb

require 'recurrent_tasks'
```

## Development

### Build / Install / Remove

Build
- eg: `gem build recurrent_tasks.gemspec -o builds/recurrent_tasks.gem`

Install
- eg: `gem install ./builds/recurrent_tasks.gem`

Verify Installation (if needed)
- `gem list recurrent_tasks`

Uninstall
- `gem uninstall recurrent_tasks`

## Release

In order to have your changes available you need to push the gem:
- `gem push builds/recurrent_tasks.gem` (assuming you builded it like described above)

## Final Notes

The gem configuration is based on:
- https://guides.rubygems.org/make-your-own-gem
- https://guides.rubygems.org/specification-reference
- Keeping the code minimal
