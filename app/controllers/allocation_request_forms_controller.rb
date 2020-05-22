class AllocationRequestFormsController < ApplicationController
  def new
    @allocation_request_form = AllocationRequestForm.new(user: @user)
  end

  def create
    @user ||= User.new(allocation_request_form_params[:user])
    @allocation_request_form = AllocationRequestForm.new(
      user: @user,
      allocation_request: AllocationRequest.new(
        allocation_request_form_params[:allocation_request]
      )
    )
    begin
      @allocation_request_form.save!
      redirect_to allocation_request_form_success_path(@allocation_request_form.allocation_request.id)
    rescue ActiveRecord::RecordInvalid => e
      byebug
      render :new, status: :bad_request
    end
  end

  def success;  end

private

  def allocation_request_form_params
    params.require(:allocation_request_form).permit(
      allocation_request: [
        :number_eligible,
        :number_eligible_with_hotspot_access
      ],
      user: [
        :full_name,
        :email_address,
        :organisation
      ]
    )
  end

end
