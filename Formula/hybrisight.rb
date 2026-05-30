class Hybrisight < Formula
  include Language::Python::Virtualenv

  desc "Deterministic cloud governance assessment CLI for AWS and Azure"
  homepage "https://hybrisight.agapii.org"
  url "https://files.pythonhosted.org/packages/source/h/hybrisight/hybrisight-0.1.3.tar.gz"
  sha256 "9bcbb850245df0a3ae96ebd1df93bb2adca490551ca498acff2a0545ef251e67"
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
