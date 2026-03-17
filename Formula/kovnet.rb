class Kovnet < Formula
  include Language::Python::Virtualenv

  desc "CLI for the KovNet childcare (kinderopvang) platform"
  homepage "https://github.com/anneschuth/kovnet-cli"
  url "https://files.pythonhosted.org/packages/27/99/6d2d2f286d258cb1181c3ff3f01a6f7ad686dfb07a46e96ceb7deacf016e/kovnet-1.1.5.tar.gz"
  sha256 "fec107e164ceb812c0b147f7453d45b4f82619c5577e5abbb623476a9640e9e7"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources(extra_pip_args: ["--extra-index-url", "https://pypi.org/simple"])
    system libexec/"bin/pip", "install", "kovnet[cli]==#{version}"
  end

  test do
    assert_match "kovnet", shell_output("#{bin}/kovnet --help")
  end
end
