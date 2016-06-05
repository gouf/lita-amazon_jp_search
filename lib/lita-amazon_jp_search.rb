require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/amazon_jp_search"

Lita::Handlers::AmazonJpSearch.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
