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

      # @official_rate = OfficialRate.update_rate
      @official_rate = OfficialRate.last.value if OfficialRate.last.present?
      # new_off_rate = OfficialRate.new(value: @official_rate)
      # new_off_rate.save! #unless OfficialRate.find_by(created_at: new_off_rate.created_at.hour)
  end

  def rate_params
    params.require(:custom_rate).permit(:value, :date)
  end
end
