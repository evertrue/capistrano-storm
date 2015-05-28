namespace :storm do
  desc 'Kill the current topology'
  task :kill do
    on roles(:app) do
      execute(
        :sudo,
        '/usr/bin/kill-topology',
        fetch(:topology_name)
      )
    end
  end

  desc 'Update the Storm topology with the new one'
  task :update do
    on roles(:app) do
      within release_path do
        execute(
          :sudo,
          '/opt/storm/current/bin/storm',
          'jar',
          fetch(:deployed_artifact_filename),
          fetch(:topology_class_name),
          fetch(:topology_name),
          fetch(:topology_other_args)
        )
      end
    end
  end
end

after 'deploy:publishing', 'storm:kill'
after 'storm:kill', 'storm:update'
