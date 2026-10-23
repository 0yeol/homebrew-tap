class OdSkills < Formula
  desc "169 design skills from nexu-io/open-design, installable into every AI coding agent"
  homepage "https://github.com/nexu-io/open-design"
  url "https://github.com/0yeol/od-skills/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "225fe5019fdf0a9f1a1741282c8911baf11c3b2e5e9242bd092c3ed806751ade"
  license "Apache-2.0"

  def install
    # Newer brew stages the archive one level below cwd; find skills/ wherever it is.
    src = Pathname.pwd
    src = Pathname.new(Dir["**/skills"].first).dirname unless (src/"skills").directory?
    od = share/"od-skills"
    od.install src/"skills" => "skills"
    od.install src/"install.sh" => "install.sh"
    (bin/"od-skills").write <<~SH
      #!/bin/bash
      exec bash "#{od}/install.sh" "$@"
    SH
  end

  def caveats
    <<~EOS
      Skills are not linked into your agents yet. Run:
        od-skills install
    EOS
  end

  def test
    assert_path_exists share/"od-skills/skills/color-expert/SKILL.md"
  end
end
