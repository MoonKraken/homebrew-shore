# typed: strict
# frozen_string_literal: true

# The TUI chatbot
class Shore < Formula
  desc "Terminal User Interface for chatting with multiple language models"
  homepage "https://github.com/MoonKraken/shore"
  url "https://github.com/MoonKraken/shore/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "" # This on release creation
  license "MIT" # Update with your actual license

  bottle do
    root_url "https://github.com/MoonKraken/shore/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "25c47dd6820f19db773358cf8ae6826004b9b0869af6a510ec92075898e5d776"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "da22df2d6343362c03f4bd22e59e025fd8376d097b0462b70cb96c13574605a8"
  end
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
