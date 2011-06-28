require 'rake'

desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |dot_file|
    next if %w[Rakefile bash].include? dot_file

    local_dot_file = File.join(ENV['HOME'], ".#{dot_file}")
    if File.exists?(local_dot_file)
      puts "removing old dot file #{local_dot_file}"
      rm_rf local_dot_file
    end

    dot_file = File.expand_path dot_file

    puts "linking #{local_dot_file} to #{dot_file}"
    ln_s dot_file, local_dot_file
  end
end
