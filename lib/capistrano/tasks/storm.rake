namespace :storm do
  desc 'Kill the current topology'
  task :kill do
    on roles(:app) do
      execute(
        :sudo,
        '/opt/storm/current/bin/storm',
        'kill',
        fetch(:topology_name)
      )
    end
  end

  desc 'Update the Storm topology with the new one'
  task update: :kill do
    on roles(:app) do
      within release_path do
        execute(
          :sudo,
          '/opt/storm/current/bin/storm',
          'jar',
          fetch(:deployed_artifact_filename),
          fetch(:topology_class_name),
          fetch(:topology_name),
          fetch(:topology_args)
        )
      end
    end
  end
end

after 'deploy:publishing', 'storm:update'
