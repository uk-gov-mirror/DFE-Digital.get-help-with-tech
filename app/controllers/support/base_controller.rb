class Support::BaseController < ApplicationController
  include Pundit

  before_action :require_dfe_user!
  after_action :verify_authorized
  after_action :verify_policy_scoped, if: :index_method?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private

  def index_method?
    %i[index results].include?(action_name)
  end

  def require_dfe_user!
    unless SessionService.is_signed_in?(session)
      redirect_to_sign_in
    end
  end

  def user_not_authorized
    render 'errors/forbidden', status: :forbidden
  end

  attr_reader :current_user
  helper_method :current_user
end
