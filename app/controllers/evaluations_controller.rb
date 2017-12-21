class EvaluationsController < ApplicationController
    
    before_action :validate_token
    before_action :find_user , only: [:index]
    before_action :find_target_user , only: [:create]

    def index        
        render json: @user.evaluations , root: false, status: :success
    end 


    def create
        @evaluation = @target_user.evaluations.new(evaluation_params)
        if @evaluation.save
            num_v = @target_user.reload.evaluations.count()
            sum_v = @target_user.reload.evaluations.sum(:score)
            @target_user.update(average_evaluation: sum_v/num_v)
            render json: @evaluation , status: :created
        else
            render json: @evaluation.errors.full_message , status: 400
        end
    end
    
    


    private

    def evaluation_params
        params.require(:evaluation).permit(:score,:anunci_id)
    end

    #the user who sends the request
    def find_user
        usID = params[:user_id]
        @user = User.find(usID)                       
    end

    #the user to be evaluated
    def find_target_user
        usID = params[:id]
        @target_user =User.find(usID) 
    end 

    def render_error_message(message)
        render json:  {error: message}, status: 400
    end  

    
end
