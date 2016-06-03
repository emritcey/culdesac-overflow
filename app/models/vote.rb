class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  def get_votable_preview
    if votable_type == 'Answer'
      answer_text = Answer.find_by(id: votable_id).description
      return answer_text.split[0...10].join(' ').concat('...')
    elsif votable_type == 'Question'
      return Question.find_by(id: votable_id).title
    end
  end


end
