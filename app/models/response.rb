# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  respondent_id    :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, :presence => true
  validate :respondent_has_not_already_answered_question
  validate :creator_must_not_answer_own_poll
  # add method to ensure uniqueness of respondent_id && answer_choice_id

  belongs_to(
    :respondent,
    :foreign_key => :respondent_id,
    :primary_key => :id,
    :class_name => "User"
  )

  belongs_to(
    :answer_choice,
    :foreign_key => :answer_choice_id,
    :primary_key => :id,
    :class_name => "AnswerChoice"
  )

  def respondent_has_not_already_answered_question
    unless existing_responses.empty? ||
      existing_responses.length == 1 &&
      existing_responses.first.id == self.id
      errors.add(:respondent_id, "Already answered question.")
    end
  end

  def creator_must_not_answer_own_poll
    poll_author = self.answer_choice.question.poll.author

    # Poll.joins("JOIN questions ON polls.id = questions.poll_id")
#         .joins("JOIN answer_choices ON questions.id = answer_choices.question_id")
#         .where("answer_choices.id = #{self.answer_choice_id}").first

    if poll_author.id == self.respondent_id
      errors.add(:respondent_id, "Can't answer own poll.")
    end
  end

  Private

  def existing_responses
    Response.find_by_sql([<<-SQL, self.respondent_id, self.answer_choice_id])
    SELECT
      *
    FROM
      responses
    JOIN
      answer_choices
    ON
      answer_choices.id = responses.answer_choice_id
    WHERE
      responses.respondent_id = ?
    AND
      answer_choices.question_id = (
      SELECT
        question_id
      FROM
        answer_choices
      WHERE
        answer_choices.id = ?
      )
    SQL
  end


end
