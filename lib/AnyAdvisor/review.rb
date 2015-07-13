module AnyAdvisor
  # Holds the respresentation of a Review
  class Review < AnyAdvisor::Model
    # @!attribute [r] score
    # @return [Integer] Score of Review
    attr_reader :score

    # @!attribute [r] body
    # @return [String] Body of the Review
    attr_reader :body

    private

    attr_writer :score, :body
  end
end
