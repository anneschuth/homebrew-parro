class Parro < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Parro school communication platform"
  homepage "https://github.com/anneschuth/parro-cli"
  url "https://files.pythonhosted.org/packages/47/ae/91f71d2307efdb9f595284994753f0cb1bf49548489f1a5c6cdcaa7906c2/parro-1.0.3.tar.gz"
  sha256 "3635699c528c6d1d2dde83c1bf28e4a5a576cf24ffdf18a19c908b2f09470ce8"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources(extra_pip_args: ["--extra-index-url", "https://pypi.org/simple"])
    system libexec/"bin/pip", "install", "parro[cli]==#{version}"
  end

  test do
    assert_match "parro", shell_output("#{bin}/parro --help")
  end
end
