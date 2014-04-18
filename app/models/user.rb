# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, :presence => true, :uniqueness => true

  has_many(
    :polls,
    :foreign_key => :author_id,
    :primary_key => :id,
    :class_name => "Poll"
  )

  has_many(
    :responses,
    :foreign_key => :respondent_id,
    :primary_key => :id,
    :class_name => "Response"
  )

  def completed_polls
    polls = Poll.joins("JOIN questions ON questions.poll_id = polls.id")
                .joins("JOIN answer_choices ON answer_choices.question_id = questions.id")
                .joins("JOIN responses ON responses.answer_choice_id = answer_choices.id")
                .where("responses.respondent_id = #{self.id}").uniq

    #.group("questions.id").having("COUNT(*) = ")
    #if count of questions == count of answer_choice
    #in the given poll, for the user(self)... completed poll
    polls
  end

end
