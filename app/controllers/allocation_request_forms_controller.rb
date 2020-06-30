class AllocationRequestFormsController < ApplicationController
  before_action :require_sign_in!

  def new
    @allocation_request_form = AllocationRequestForm.new
  end

  def create
    @allocation_request_form = AllocationRequestForm.new(allocation_request_form_params.merge(created_by_user: @user))
    begin
      @allocation_request_form.save!
      redirect_to success_allocation_request_forms_path(@allocation_request_form.allocation_request.id)
    rescue ActiveModel::ValidationError
      render :new, status: :bad_request
    end
  end

  def success
    @allocation_request = AllocationRequest.where(id: params[:allocation_request_id], created_by_user_id: @user.id).first
    if @allocation_request
      @allocation_request_form = AllocationRequestForm.new(allocation_request: @allocation_request)
    else
      render template: 'errors/not_found', status: :not_found
    end
  end

private

  def allocation_request_form_params
    params.require(:allocation_request_form).permit(
      :number_eligible,
      :number_eligible_with_hotspot_access,
    )
  end
end
