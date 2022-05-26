class Souffle < Formula
  desc "Logic Programming Language based on Datalog."
  homepage "https://souffle-lang.github.io"
  stable do
    url "https://github.com/souffle-lang/souffle/archive/refs/tags/2.2.tar.gz"
    sha256 "81e5453512cd74774af8910b77bd2ba7a434179a47c4f9e3955fc204d20c78cb"
  end
  head "https://github.com/souffle-lang/souffle.git", :shallow => false

  depends_on "bison" => :build
  depends_on "cmake" => :build
  depends_on "libffi" => :build
  depends_on "mcpp"
  depends_on "pkg-config" => :build
  depends_on "gcc"

  def install
    if build.head?
      system "git", "fetch", "--tags"
    end

    system "cmake", "-B", "build", "-S", ".", "-DCMAKE_INSTALL_PREFIX=#{prefix}","-DSOUFFLE_GIT=OFF", "-DSOUFFLE_BASH_COMPLETION=OFF", "-DCMAKE_C_COMPILER=gcc-11", "-DCMAKE_CXX_COMPILER=g++-11"
    system "cmake", "--build", "build", "--target", "install", "-j17"
  end

  test do
    system "false"
  end
end
