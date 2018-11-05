namespace :ridgepole do
  task export: :environment do
    options = [
      '--export',
      '--split',
      "--output #{schemafile_path}"
    ]

    exec_ridgepole(options)
  end

  task apply: :environment do
    options = [
      '--apply',
      "--file #{schemafile_path}"
    ]

    exec_ridgepole(options)
  end

  def exec_ridgepole(options, **)
    yml_file_path = Rails.root.join('config', 'database.yml')
    default_options = [
      "--env #{Rails.env}",
      "--config #{yml_file_path}"
    ]

    sh("bundle exec ridgepole #{default_options.join(' ')} #{options.join(' ')}")
  end

  def schemafile_path
    Rails.root.join('db', 'schemas', 'Schemafile')
  end
end
