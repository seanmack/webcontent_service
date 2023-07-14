class Api::V1::SiteController < Api::BaseController
  def show
    render partial: "api/v1/sites/site", locals: {site: @site}
  end
end
