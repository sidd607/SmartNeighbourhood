class AttemptsController < ApplicationController

  helper 'surveys'

  before_filter :load_active_survey
  before_filter :normalize_attempts_data, :only => :create
  before_filter :authorize, :user_profile_complete, :find_profile, :get_notify
  $id = 0
  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end

  def new
    @participant = @current_profile # you have to decide what to do here
    params[:survey_id] = params[:format].to_i
    $id = params[:format].to_i
    @survey = Survey::Survey.find(params[:format].to_i)
    unless @survey.nil?
      @attempt = @survey.attempts.new
      @attempt.answers.build
    end
  end

  def create
    #render :action => :err
    @survey = Survey::Survey.find($id)
    
    @attempt = @survey.attempts.new(attempt_params)
    @attempt.participant = @current_profile

    if @attempt.valid? && @attempt.save
      #redirect_to view_context.new_attempt, alert: I18n.t("attempts_controller.#{action_name}")
      flash[:alert] = "Your response has been recorded! Thanks!"
      redirect_to(:controller => "surveys" , :action => "index")
    else
      render :action => :new
    end
  end

  private

  def load_active_survey
    @survey =  Survey::Survey.active.first
  end

  def normalize_attempts_data
    normalize_data!(params[:survey_attempt][:answers_attributes])
  end

  def normalize_data!(hash)
    multiple_answers = []
    last_key = hash.keys.last.to_i

    hash.keys.each do |k|
      if hash[k]['option_id'].is_a?(Array)
        if hash[k]['option_id'].size == 1
          hash[k]['option_id'] = hash[k]['option_id'][0]
          next
        else
          multiple_answers <<  k if hash[k]['option_id'].size > 1
        end
      end
    end

    multiple_answers.each do |k|
      hash[k]['option_id'][1..-1].each do |o|
        last_key += 1
        hash[last_key.to_s] = hash[k].merge('option_id' => o)
      end
      hash[k]['option_id'] = hash[k]['option_id'].first
    end
  end

  def attempt_params
    rails4? ? params_whitelist : params[:survey_attempt]
  end

  def params_whitelist
    params.require(:survey_attempt).permit(Survey::Attempt::AccessibleAttributes)
  end


end
