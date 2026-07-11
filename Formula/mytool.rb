class Mytool < Formula
  desc "Simple formula library and app example"
  homepage "https://github.com/debugee/mytool"
  url "https://github.com/debugee/mytool/archive/refs/tags/9.0.tar.gz"
  sha256 "e33e118cb6f904215ba20f3f0a54407da048ca323aeeae224794f7232b49b5d0"
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
