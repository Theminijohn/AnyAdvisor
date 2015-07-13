require 'engtagger'
require 'nokogiri'
require 'open-uri'

require 'pry-rails' #dev

module AnyAdvisor
	class TopReviewRequest
    attr_accessor :config

		attr_reader :score, :body, :image_url
		Review = Struct.new(:score, :body, :image_url)

		def initialize(url, config = Configuration.new)
			@url = url
      @config = config
		end

		def get
			begin
				@tagger = EngTagger.new
				@page ||= Nokogiri::HTML(open(@url))
				reviews = @page.css('div#REVIEWS').css('div.reviewSelector')

				# Those adjectives score more points
				atlas = ['professional', 'amazing', 'friendly', 'great', 'interesting']
				five_star_reviews = []

				reviews.each do |review|
					if has_five_stars?(review)
					score = 0

					truncated_review = review.css('div.entry').css('p').text.truncate_words(config.truncation_limit)
					tagged = @tagger.add_tags(truncated_review)
					adj = @tagger.get_adjectives(tagged)

					if adj.any?
						adj.each do |a|
							score += 0.5 if atlas.include? a.first
						end
					end

					r = Review.new(
						(adj.count + score),
						truncated_review
					)

					five_star_reviews << r
				end
			end

			# Return
			review = five_star_reviews.sort! { |x, y| x["score"] <=> y["score"]  }.last
      image_url = AnyAdvisor::Image.new(review.body).generate
      review.image_url = image_url

      review
			rescue StandardError => e
				e.message
			end
		end

		protected

		def has_five_stars?(review)
			review.css('div.basic_review').css('div.col2of2').css('div.innerBubble').css('div.rating').css('img.s50').present?
		end

	end
end
