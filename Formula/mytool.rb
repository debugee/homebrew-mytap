class Mytool < Formula
  desc "Simple formula library and app example"
  homepage "https://github.com/debugee/mytool"
  url "https://github.com/debugee/mytool/archive/refs/tags/3.0.tar.gz"
  sha256 "2423bb4e7fa460c13adcfc8de4cf9244d8554b6ac070347ca7a5ccf8c2a22791"
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