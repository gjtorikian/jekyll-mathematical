require "rubygems"

require "jekyll"
require "liquid"

include Jekyll

require File.expand_path("lib/jekyll-mathematical.rb")

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    @fixtures_path = Pathname.new(__FILE__).parent.join("fixtures")
    @dest = @fixtures_path.join("_site")
    @posts_src = File.join(@fixtures_path, "_posts")
    @layouts_src = File.join(@fixtures_path, "_layouts")
    @plugins_src = File.join(@fixtures_path, "_plugins")

    @site = Jekyll::Site.new(Jekyll.configuration({
      "source"      => @fixtures_path.to_s,
      "destination" => @dest.to_s,
      "plugins"     => @plugins_src
    }))

    @dest.rmtree if @dest.exist?
  end

  config.after(:all) do
    @dest.rmtree if @dest.exist?
  end

  def post_path(file)
    File.join(@posts_src, file)
  end

  def setup_post(file)
    Post.new(@site, @fixtures_path, '', file)
  end

  def do_render(post, layout)
    layouts = { layout.sub(/\.html/, '') => Layout.new(@site, @layouts_src, layout)}
    post.render(layouts, {"site" => {"posts" => []}})
  end
end
