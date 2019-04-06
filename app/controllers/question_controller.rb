class QuestionController < ActionController::Base
  def question
    redirect_to 'https://stackoverflow.com/questions/ask?tags=hyperstack+ruby-on-rails+reactjs+ruby+isomorphic'
  end

  def questions
    redirect_to 'https://stackoverflow.com/questions/tagged/hyperstack'
  end
end
