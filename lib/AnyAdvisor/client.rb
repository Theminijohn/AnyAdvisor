module AnyAdvisor
  class Client

    # @!attribute [r] url
    # @return [String] Url of the Tripadvisor Page
    attr_reader :url

    def reviews
      @review_request ||= ReviewsRequest.new(url)
    end

    def top_review
      @top_review ||= TopReviewRequest.new(url)
    end

    # def image
    #   @image_request ||= ImageRequest.new(url)
    # end

    def initialize url
      @url = url
    end

  end
end
