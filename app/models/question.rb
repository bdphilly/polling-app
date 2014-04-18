# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :body, :presence => true

  belongs_to(
    :poll,
    :foreign_key => :poll_id,
    :primary_key => :id,
    :class_name => "Poll"
  )

  has_many(
    :answer_choices,
    :foreign_key => :question_id,
    :primary_key => :id,
    :class_name => "AnswerChoice"
  )

  def results

    results_hash = Hash.new

    answer_choices_with_response = self
     .answer_choices
     .select("answer_choices.*, COUNT(*) AS answer_choices_count")
     .joins(:responses)
     .group("answer_choices.id")

     answer_choices_with_response.each do |answer_choice|
       results_hash[answer_choice.answer_choice] = answer_choice.answer_choices_count
     end

     results_hash
  end

end
