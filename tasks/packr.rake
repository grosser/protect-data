desc "Pack javascript using packr (slower execution but faster load time)"
task :packr => :dist do
  require 'packr/packr'
  # paths to jsmin script and final minified file
  dist = "dist/#{APP_FILE_NAME}" 
  final = dist.sub(/.js$/,'.pack.js')
  final_vers = dist.sub(/.js$/,"-#{APP_VERSION}.pack.js")

  #pack and save
  script = File.read(dist);
  #without version
  f = File.open(final,'w');
  f.write(Packr.pack(script, :base62 => true))
  puts "\n#{final}"

   #with version
  f = File.open(final_vers,'w');
  f.write(Packr.pack(script, :base62 => true))
  puts "\n#{final_vers}"
end