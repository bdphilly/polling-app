class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, :presence => true
  validate :respondent_has_not_already_answered_question
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
    true if existing_responses.empty? ||
      existing_responses.length == 1 &&
      existing_responses.first.id == self.id
  end

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