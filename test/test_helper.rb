require "rack/test"
require "test/unit"

# Always use local Rulers first
d = File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH.unshift File.expand_path(d)

require "rulers"
