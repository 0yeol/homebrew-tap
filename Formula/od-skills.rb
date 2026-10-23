class OdSkills < Formula
  desc "169 design skills from nexu-io/open-design, installable into every AI coding agent"
  homepage "https://github.com/nexu-io/open-design"
  url "https://github.com/0yeol/od-skills/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc87d426c3c67409336b2dbdb7c60a088e87a7be6f8d64e6836ae864469ae32c"
  license "Apache-2.0"

  def install
    od = share/"od-skills"
    od.install "skills"
    od.install "install.sh"
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
