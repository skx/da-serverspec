

#
# Launch the tests, if the gems are present.
#
run: gems
	bundle exec rake spec

#
# Install the test depedencies
#
gems:
	bundle  install --path ./gems/
