require "spec_helper"

describe(Jekyll::Converters::Mathematical) do

  def setup(file, layout)
    @post = setup_post(file)
    do_render(@post, layout)
  end

  it "does nothing to non-math content" do
    setup("1984-03-06-no-math.md", "basic_layout.html")
    expect(@post.output).to match /\*\*No math\.\*\*/
  end

  it "converts inline math" do
    setup("1984-03-06-inline-math.md", "basic_layout.html")
    expect(@post.output).to match /<img class="inline-math" data-math-type="inline-math" src="data:image\/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjcuNjc2NDM0cHQiIGhlaWdodD0iOC4yMDMxMjVwdCIgdmlld0JveD0iMCAwIDI3LjY3NjQzNCA4LjIwMzEyNSIgdm/
  end

  it "converts display math" do
    setup("1984-03-06-display-math.md", "basic_layout.html")
    puts @post.output
    expect(@post.output).to match /Here it is: <img class="display-math" data-math-type="display-math" src="data:image\/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTA1LjE1NDk3OHB0IiBoZWlnaHQ9IjMxLjA3MTQ4NHB0IiB2aWV3Qm94PSIwIDAgMTA1LjE1NDk3OCAzMS4wNzE0O/
  end
end

