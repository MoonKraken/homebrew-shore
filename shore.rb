# typed: strict
# frozen_string_literal: true

# The TUI chatbot
class Shore < Formula
  desc "Terminal User Interface for chatting with multiple language models"
  homepage "https://github.com/MoonKraken/shore"
  url "https://github.com/MoonKraken/shore/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "" # This on release creation
  license "MIT" # Update with your actual license
  head "https://github.com/MoonKraken/shore.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      To use Shore, you'll need to set API keys for the providers you want to use:
        export OPENAI_API_KEY="your-openai-api-key"
        export ANTHROPIC_API_KEY="your-anthropic-api-key"
        export GROQ_API_KEY="your-groq-api-key"
        export HF_API_KEY="your-huggingface-api-key"
    EOS
  end

  test do
    # Test that the binary exists and can show version/help
    output = shell_output("#{bin}/shore --help")
    assert_match(/shore/i, output)
  end
end
