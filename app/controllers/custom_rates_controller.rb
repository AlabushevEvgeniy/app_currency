class CustomRatesController < ApplicationController
  def new
    @rate = CustomRate.new
  end

  def create
    # binding.pry
    rate = CustomRate.create!(rate_params)

    if rate.save!
      redirect_to root_url, notice: 'New forced rate was successfully created'
    end
  end

  def show
      @rate = CustomRate.last if CustomRate.last.present?

      @official_rate = OfficialRate.update_rate
  end

  def rate_params
    params.require(:rate).permit(:custom_value, :date)
  end
end
