class QuestionController < ActionController::Base
  def index
    redirect_to 'https://stackoverflow.com/questions/ask?tags=hyperstack+ruby-on-rails+reactjs+ruby+isomorphic'
  end
end
