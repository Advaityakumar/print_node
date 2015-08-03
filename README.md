# PrintNode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/print_node`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'print_node'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install print_node

## Usage

Print Node is a wrapper that contains methods which print the pdf files and get printer details. Create printnode api key and add api creds in .env file.

##in .env file

```ruby
USERNAME='your_printnode_api_username'
PASSWORD='your_printnode_api_key'
```

### Configuration Options

You can configure credentails via `PrintNode::PrintJob.new`.

```ruby
client = PrintNode::PrintJob.new
```

Please take care to **never commit credentials to source control**. We strongly recommended loading credentials from an external source.

### Get All Printer Details

Returns a list of printers that are associated to your account.

```ruby
# To retrieve a list of printer details.

client.get_printers
```

### Print Pdf File

Print the pdf file.

```ruby
# To print the pdf file you have to pass three arguments (printer_id, title and content) in this method.
Eg:
client.print_file(51012, 'Pdftitle', 'http://online.wsj.com/public/resources/documents/Reprint_Samples.pdf')

# In this method either you can pass the local url of your file and if you want to print online pdf file then pass that url.

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/Advaityakumar/print_node/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request