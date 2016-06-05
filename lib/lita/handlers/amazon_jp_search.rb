require 'mechanize/amazon_jp_search/client'

module Lita
  module Handlers
    class AmazonJpSearch < Handler
      # insert handler code here
      route(/^amazon\s(.+)/i, :search_amazon)

      def search_amazon(response)
        client = Mechanize::AmazonJpSearch::Client.new(3)
        query = response.matches.first.join(' ')

        search_result = client.search(query)

        search_result.each do |result|
          price = separated_digit(result[:price])
          response.reply "#{result[:title]} ￥#{price}\n#{result[:href]}"
        end
      end

      Lita.register_handler(self)

      private

      def separated_digit(number)
        number.to_s
              .chars
              .reverse
              .map
              .with_index(1) { |x, i| i.modulo(3).zero? ? ",#{x}" : x  }
              .reverse
              .join('')
      end
    end
  end
end
