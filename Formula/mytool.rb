class Mytool < Formula
  desc "Simple formula library and app example"
  homepage "https://github.com/debugee/mytool"
  url "https://github.com/debugee/mytool/archive/refs/tags/10.0.tar.gz"
  sha256 "053e8f27ba0f665884f440daa33bed7c226950eb42640e10e3e06c22f4f19e3a"
  license "MIT"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

  test do
    system "#{bin}/mytool", "--version" if File.exist?("#{bin}/mytool")
  end
end
