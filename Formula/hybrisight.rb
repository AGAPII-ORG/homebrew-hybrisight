class Hybrisight < Formula
  include Language::Python::Virtualenv

  desc "Deterministic cloud governance assessment CLI for AWS and Azure"
  homepage "https://hybrisight.agapii.org"
  url "https://files.pythonhosted.org/packages/source/h/hybrisight/hybrisight-0.1.4.tar.gz"
  sha256 "cb13708d243ba9afecb2210cce39d6c691f19e9a2f30e52f037f8992d51678c0"
  license "Apache-2.0"
  revision 1

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "HybriSight", shell_output("#{bin}/hybrisight --version")
  end
end
