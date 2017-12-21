class EvaluationsController < ApplicationController
    
    before_action :validate_token
    before_action :check_params
    
    def create
        @evaluation = @target_user.evaluations.new(evaluation_params)
        if @evaluation.save!
            render json: @evaluation , status: :created
        else
            render json: @evaluation.errors.full_message , status: 400
        end
    end
    
    


    private

    def evaluation_params
        params.require(:evaluation).permit(:user_id,:score,:anunci_id)
    end

    def find_sourceUser
        usID =  params[:user_id].present? ? params[:user_id] : nil
        @user = usID != nil ? User.find(usID) : nil       
    end

    def find_targetUser
        usID = params[:id]
        @target_user =User.find(usID) 
    end 

    def find_anunci
        valid_params = evaluation_params
        anunID = valid_params[:anunci_id].present? ? valid_params[:anunci_id] : nil
        @anunci = anunID != nil ? Anunci.find(anunID) : nil
    end

    def check_params
        #p(params)
        find_sourceUser
        #p(@user)
        render_error_message("Invalid ID for the user sending the request") and return if @user == nil
        find_targetUser
        #p(@target_user)
        render_error_message("Invalid ID for the user being validated") and return if @target_user == nil
        render_error_message("A user cannot validate himself") and return if @target_user.id == @user.id
        find_anunci
        render_error_message("Invalid ID for the Anunci to which the evaluation references") and return if @anunci == nil
    end

    def render_error_message(message)
        render json:  {error: message}, status: 400
    end

        

    
end
