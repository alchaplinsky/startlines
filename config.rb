require 'lib/timeline'
###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

pages = Dir.glob("./source/pages/*.html*")
pages.each do |page_path|
  # Get each page's filename (not including the extensions)
  page = page_path.match(/.\/source\/pages\/([^\.]*)\..*/).captures[0]

  # Make requests to /page/ load the content at /pages/page.html.any.extension
  proxy "/#{page}/index.html", "/pages/#{page}.html", :ignore => true
end
@timelines = Timeline.all

@timelines.map{|t| t.attributes[:name].downcase }.each do |id|
  proxy "/timelines/#{id}/index.html", "/pages/timeline.html", locals: { timeline: Timeline.find(id)}, ignore: true
end

# Autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', '> 1%']
  config.cascade  = false
end

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = "gh-pages"
  deploy.clean = true
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
