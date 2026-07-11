class Mytool < Formula
  desc "Simple formula library and app example"
  homepage "https://github.com/debugee/mytool"
  url "https://github.com/debugee/mytool/archive/refs/tags/8.0.tar.gz"
  sha256 "2a5c1eee5690617c4ce62029c5a50c5965dca1bf7ca8494ccd9af1b3686567da"
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
