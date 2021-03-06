class SurveysController < ApplicationController

before_filter :load_survey, :only => [ :edit, :update]
before_filter :authorize, :user_profile_complete, :find_profile, :get_notify

  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end



  def index
    @surveys = Survey::Survey.all
  end

  def new
    @survey = Survey::Survey.new
  end

  def create
  	@survey = Survey::Survey.new(survey_params.merge(:user_id => @current_profile.id))
    #@survey = Survey::Survey.new(survey_params)
    if @survey.valid? && @survey.save
      default_redirect
    else
      render :action => :new
    end
  end

  def edit
  end

  def show
  
  @survey = Survey::Survey.find(params[:id])
   @questions = @survey.questions
   @answers = Survey::Answer.select("option_id , COUNT(option_id) as count").group("option_id").where(question_id: @questions.select(:id) )
   #if session[:user_id]!= @survey.user_id
    flash[:alert] = "You are not allowed to view the responses for this survey!"
    #redirect_to(:action => 'index')
   #end
  $c = @answers
  end

  def update
    if @survey.update_attributes(survey_params)
      default_redirect
    else
      render :action => :edit
    end
  end

  private

  def default_redirect
    redirect_to surveys_path, alert: I18n.t("surveys_controller.#{action_name}")
  end

  def load_survey
    @survey = Survey::Survey.find(params[:id])
  end

  def survey_params
    rails4? ? params_whitelist : params[:survey_survey]
  end

  def params_whitelist
    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes)
  end



end
