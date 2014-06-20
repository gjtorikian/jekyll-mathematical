# Mathematical Plugin

A converter for Jekyll to generate an SVG/Base64 math equation.

Add the following to your site's `_config.yml` file

```yml
gems:
  - jekyll-mathematical
```

That *should* convert all your content written in itex notation into base64-encoded SVGs.

Behind the scenes, this plugin uses [math-to-itex](https://github.com/gjtorikian/math-to-itex) (for detection) and [mathematical](https://github.com/gjtorikian/mathematical) (for conversion).