require "spec_helper"

describe(Jekyll::Converters::Mathematical) do

  def setup(file, layout)
    @post = setup_post(file)
    do_render(@post, layout)
  end

  it "does nothing to non-math content" do
    setup("1984-03-06-no-math.md", "basic_layout.html")
    expect(@post.output).to match /No math./
  end

  it "converts inline math" do
    setup("1984-03-06-inline-math.md", "basic_layout.html")
    expect(@post.output).to match /<img class="inline-math" data-math-type="inline-math"/
  end

  it "converts display math" do
    setup("1984-03-06-display-math.md", "basic_layout.html")
    expect(@post.output).to match /Here it is: <img class="display-math" data-math-type="display-math"/
  end
end

