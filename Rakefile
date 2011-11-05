require 'rake'

def sym_link(source, destination)
  if File.exists?(destination)
    puts "removing destination file #{destination}"
    rm_rf destination
  end

  source = File.expand_path source

  puts "linking #{source} to #{destination}"
  ln_s source, destination
end

desc "Install the dot files into user's home directory"
task :install => [:setup_dot_files, :setup_rvm]

task :setup_dot_files do
  Dir['*'].each do |dot_file|
    next if %w[Rakefile bash rvm].include? dot_file

    local_dot_file = File.join(ENV['HOME'], ".#{dot_file}")
    sym_link dot_file, local_dot_file
  end
end

task :setup_rvm do
  after_use_hooks_file = File.join(File.dirname(__FILE__), 'rvm', 'after_use_hooks')
  destination_hooks_file = File.join(ENV['HOME'], '.rvm', 'hooks', 'after_use_hooks')
  sym_link after_use_hooks_file, destination_hooks_file
end

task :default => :install
