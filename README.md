# AnyAdvisor

AnyAdvisor parses Tripadvisor pages and get's back to you with all the 5★ Reviews. Every Review has a `score`, based on the adjectives the `body` contains. Some Adjectives weight more than others. Optionally you can export your Top Review to an Image.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'AnyAdvisor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install AnyAdvisor

## Usage

```ruby
page = AnyAdvisor::Client.new(page_url)

# => [ReviewsRequest]
# => Returns all 5★ Reviews
page.reviews.get

# => [ReviewRequest]
# => Returns Top Review based on Score + Image
page.top_review.get

# => [Image]
# => Returns an Image with the text provided
AnyAdvisor::Image.new('Oh captain my Captain').generate
```

## Options

In `config/initializers/any_advisor.rb`:

```ruby
# Defaul Values
AnyAdvisor.configure do |config|
  config.export_image_width = 500
  config.export_image_path = './any_advisor.jpg'
  config.text_box_width = 350
  config.default_image_url = nil
  config.point_size = 50
  config.font_color = '#fff'
  config.font_family = 'Times'
  config.aws_region = 'us-east-1'
  config.aws_akid = '12345678'
  config.aws_secret = '12345678'
end
```


## Development

- You have a `rake console` with a `reload!` method.
- You'll need `ImageMagick' 
- If you get an `Magick::ImageMagickError: unable to read font` try: `brew install gs`



## Contributing

1. Fork it ( https://github.com/theminijohn/AnyAdvisor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request