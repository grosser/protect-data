desc "Minify javascript src for production environment"
task :minify => :dist do
  # paths to jsmin script and final minified file
  jsmin = 'lib/jsmin.rb'
  dist = "dist/#{APP_FILE_NAME}" 
  final = dist.sub(/.js$/,'.min.js')
  final_vers = dist.sub(/.js$/,"-#{APP_VERSION}.min.js")

  # create single tmp js file
  tmp = Tempfile.open('all')
  tmp.write(open(dist).read)
  tmp.rewind

  # minify file
  %x[ruby #{jsmin} < #{tmp.path} > #{final}]
  puts "\n#{final}"
  %x[ruby #{jsmin} < #{tmp.path} > #{final_vers}]
  puts "\n#{final_vers}"
end