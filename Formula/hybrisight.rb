class Hybrisight < Formula
  desc "Deterministic cloud governance assessment CLI for AWS and Azure"
  homepage "https://hybrisight.agapii.org"
  url "https://files.pythonhosted.org/packages/source/h/hybrisight/hybrisight-0.1.2.tar.gz"
  sha256 "1a96cd7677b319700e0b17a5162d5ed10489231348938ed590dfa57fa152bb95"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/hybrisight"
  end

  test do
    assert_match "HybriSight", shell_output("#{bin}/hybrisight --version")
  end
end
