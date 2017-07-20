SparkPostRails.configure do |c|
  c.api_key = Configuration[:sparkpost_key]
  c.track_opens = true                            # default: false
  c.track_clicks = true                      # default: false
  c.inline_css = true
  c.html_content_only = true  
end