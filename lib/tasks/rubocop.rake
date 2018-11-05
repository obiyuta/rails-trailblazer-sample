task rubocop: :environment do
  options = %w[
    --display-cop-names
    --display-style-guide
  ]

  target_directories = %w[
    app
    lib
    spec
    config
  ]

  sh("bundle exec rubocop #{options.join(' ')} #{target_directories.join(' ')}")
end

task rubocop_correct: :environment do
  options = %w[
    --display-cop-names
    --display-style-guide
    -a
  ]

  target_directories = %w[
    app
    lib
    spec
    config
  ]

  sh("bundle exec rubocop #{options.join(' ')} #{target_directories.join(' ')}")
end
