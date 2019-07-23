class CustomRatesController < ApplicationController
  def new
    @custom_rate = CustomRate.new
  end

  def create
    # binding.pry
    custom_rate = CustomRate.create!(rate_params)

    if custom_rate.save!
      redirect_to root_url, notice: 'New forced rate was successfully created'
    end
  end

  def show
      @custom_rate = CustomRate.last if CustomRate.last.present?

      @official_rate = OfficialRate.update_rate
  end

  def rate_params
    params.require(:custom_rate).permit(:value, :date)
  end
end
