class ChargesController < ApplicationController

  def index
    @successful_charges = Charge.optimized.successful
    @failed_charges = Charge.optimized.failed
    @disputed_charges = Charge.optimized.disputed
  end

end