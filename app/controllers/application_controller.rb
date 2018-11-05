class ApplicationController < ActionController::Base
  def current_user
    # dummy
  end

  # Trailbrazer: Inject values to 'options'
  def _run_options(options)
    options.merge(
      current_user: current_user
    )
  end
end
