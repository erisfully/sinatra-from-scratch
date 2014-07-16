root_dir = File.expand_path("./..", __FILE__)

Dir.glob("#{root_dir}/lib/tasks/*.rake").each { |r| import r }