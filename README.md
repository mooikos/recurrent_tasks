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

In order to have your changes available you need to:

- Create a Pull Request that include below changes (or aggregate them with your changes)
  - Bump the aruba version in `lib/recurrent_tasks/version.rb` (try to follow [semantic versioning](https://semver.org))
  - Run `bundle` (which will regenerate the `Gemfile.lock`)
- Get the Pull Request approved and merged.
- Create and Publish the new tag based on the version by:
  - Switching locally to `main` branch and pulling the update version that was merged above
  - Run `bundle exec rake tags:create`.

Now you will be able to update the needed tag in the repositories needing it.

## Final Notes

The gem configuration is based on:
- https://guides.rubygems.org/make-your-own-gem
- https://guides.rubygems.org/specification-reference
- Keeping the code minimal
