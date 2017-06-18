class PaymentsController < InheritedResources::Base

  private

    def payment_params
      params.require(:payment).permit(:participant_id, :paid_at, :amount, :description)
    end
end

