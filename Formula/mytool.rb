class Mytool < Formula
  desc "Simple formula library and app example"
  homepage "https://github.com/debugee/mytool"
  url "https://github.com/debugee/mytool/archive/refs/tags/7.0.tar.gz"
  sha256 "f94d6ac3455961f6473f675c2fad7a5328ff586f72c86924fd388f2cfb3001c4"
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
