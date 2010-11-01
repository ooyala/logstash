Gem::Specification.new do |spec|
  files = []
  dirs = %w{lib examples etc patterns}
  dirs.each do |dir|
    files += Dir["#{dir}/**/*"]
  end

  rev = %x{svn info}.split("\n").grep(/Revision:/).first.split(" ").last.to_i
  #rev = Time.now.strftime("%Y%m%d%H%M%S")
  spec.name = "logstash"
  spec.version = "0.1.#{rev}"
  spec.summary = "logstash - log and event management"
  spec.description = "None yet"
  spec.add_dependency("eventmachine-tail")
  spec.add_dependency("jls-grok", ">= 0.2.3071")
  spec.add_dependency("awesome_print")
  spec.add_dependency("json")

  # TODO: In the future, make these optional
  # for websocket://
  spec.add_dependency("em-websocket")
  # For amqp://
  spec.add_dependency("amqp")
  spec.add_dependency("uuidtools")

  spec.files = files
  spec.require_paths << "lib"
  spec.bindir = "bin"
  spec.executables << "logstash"

  spec.author = "Jordan Sissel"
  spec.email = "jls@semicomplete.com"
  spec.homepage = "http://code.google.com/p/logstash/"
end
