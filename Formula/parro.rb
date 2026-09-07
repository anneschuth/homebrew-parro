class Parro < Formula
  include Language::Python::Virtualenv

  desc "CLI for the Parro school communication platform"
  homepage "https://github.com/anneschuth/parro-cli"
  url "https://files.pythonhosted.org/packages/51/83/51bfc2949beafe59d5cff867c88ef1cc393f0becc6411eace02d56082614/parro-1.1.0.tar.gz"
  sha256 "82817afd2ab71e01f0d4e0e0865487f03aaeec98143ed0667e806e199d093c0a"
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
