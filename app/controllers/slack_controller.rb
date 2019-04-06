class SlackController < ActionController::Base
  def index
    redirect_to 'https://hyperstack-org.slack.com'
  end

  def invite
    redirect_to 'https://join.slack.com/t/hyperstack-org/shared_invite/enQtNTg4NTI5NzQyNTYyLTYzYTZhYTE2MGE5ZTQ0OTAyNDVlMzE5OTk5NWNmZmMzYjhkZGY1MDc3MGFjMGZlYzE5ZWJhZDJiMmQyYzAxMjY'
  end

end
