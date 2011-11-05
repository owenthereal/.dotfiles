vim_plugin_task "go" do
  if ENV['GOROOT']
    require 'pathname'

    vim_dir = Pathname.new("#{ENV['HOME']}/.vim/")
    go_vim_path = Pathname.new("#{ENV['GOROOT']}/misc/vim/")
    Dir[go_vim_path.join("**/*.vim").to_s].each do |plug_in|
      plug_in_path = Pathname.new(plug_in)
      plug_in_relative_path = plug_in_path.relative_path_from(go_vim_path)
      vim_plug_in_path = vim_dir.join(plug_in_relative_path).dirname

      FileUtils.mkdir_p(vim_plug_in_path.to_s)
      FileUtils.rm_rf(vim_dir.join(plug_in_path).to_s)
      FileUtils.ln_s(plug_in_path.to_s, vim_plug_in_path.to_s)
    end
  end
end
