class School::Internet::Mobile::BulkRequestsController < School::BaseController
  before_action { render_404_unless_school_in_mno_feature(@school) }

  def new
    @upload_form = BulkUploadForm.new
  end

  def create
    @upload_form = BulkUploadForm.new(upload_form_params)

    if @upload_form.valid?
      # parse file and generate records
      begin
        @summary = importer.import!(@upload_form.file.path, extra_fields: { created_by_user: @user, school: @school })
        render :summary
      rescue StandardError => e
        Rails.logger.error(e.message)
        @upload_form.errors.add(:upload, I18n.t('errors.bulk_upload_form.theres_a_problem_with_that_spreadsheet'))
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def upload_form_params
    params.fetch(:bulk_upload_form, {}).permit(%i[upload])
  end

  def importer
    @importer ||= ExtraDataRequestSpreadsheetImporter.new
  end
end