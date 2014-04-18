joe = User.create!(:user_name => "Joe User")
susie = User.create!(:user_name => "Susie Q")
ned = User.create!(:user_name => "Ned")
buck = User.create!(:user_name => "Buck")


a = Poll.create!(:title => "Favorites", :author_id => joe.id)

q1 = Question.create!(:body => "What is your favorite breakfast food?", :poll_id => a.id)
q2 = Question.create!(:body => "What is your favorite day of the week?", :poll_id => a.id)
q3 = Question.create!(:body => "What is your favorite holiday?", :poll_id => a.id)
q4 = Question.create!(:body => "What is your favorite programming language?", :poll_id => a.id)

a1 = AnswerChoice.create!(:answer_choice => "Waffles", :question_id => q1.id)
a2 = AnswerChoice.create!(:answer_choice => "Bacon", :question_id => q1.id)
a3 = AnswerChoice.create!(:answer_choice => "Toast", :question_id => q1.id)

b1 = AnswerChoice.create!(:answer_choice => "Monday", :question_id => q2.id)
b2 = AnswerChoice.create!(:answer_choice => "Friday", :question_id => q2.id)
b3 = AnswerChoice.create!(:answer_choice => "Sunday", :question_id => q2.id)

c1 = AnswerChoice.create!(:answer_choice => "Christmas", :question_id => q3.id)
c2 = AnswerChoice.create!(:answer_choice => "New Years", :question_id => q3.id)
c3 = AnswerChoice.create!(:answer_choice => "Birthday", :question_id => q3.id)

d1 = AnswerChoice.create!(:answer_choice => "Ruby", :question_id => q4.id)
d2 = AnswerChoice.create!(:answer_choice => "SQL", :question_id => q4.id)
d3 = AnswerChoice.create!(:answer_choice => "Javascript", :question_id => q4.id)

Response.create!(:respondent_id => ned.id, :answer_choice_id => a1.id)
Response.create!(:respondent_id => ned.id, :answer_choice_id => b1.id)
Response.create!(:respondent_id => ned.id, :answer_choice_id => c1.id)
Response.create!(:respondent_id => ned.id, :answer_choice_id => d1.id)

Response.create!(:respondent_id => buck.id, :answer_choice_id => a2.id)
Response.create!(:respondent_id => buck.id, :answer_choice_id => b2.id)
Response.create!(:respondent_id => buck.id, :answer_choice_id => c2.id)
Response.create!(:respondent_id => buck.id, :answer_choice_id => d2.id)

Response.create!(:respondent_id => susie.id, :answer_choice_id => a3.id)
Response.create!(:respondent_id => susie.id, :answer_choice_id => d2.id)


# b = Poll.create!(:title => "Favorite Breakfast Food", :author_id => joe.id)
# c = Poll.create!(:title => "Apocalypse Now?", :author_id => susie.id)

# q1 = Question.create!(:body => "What is your favorite breakfast food?", :poll_id => b.id)
# q2 = Question.create!(:body => "Who is your favorite Apocalypse Now character?", :poll_id => c.id)
#
# b1 = AnswerChoice.create!(:answer_choice => "Waffles", :question_id => q1.id)
# b2 = AnswerChoice.create!(:answer_choice => "Pancakes", :question_id => q1.id)
# c1 = AnswerChoice.create!(:answer_choice => "Marlon Brando", :question_id => q2.id)
# c2 = AnswerChoice.create!(:answer_choice => "Robert Duvall", :question_id => q2.id)
#
# Response.create!(:respondent_id => ned.id, :answer_choice_id => c1.id)
# Response.create!(:respondent_id => ned.id, :answer_choice_id => b1.id)
#
# Response.create!(:respondent_id => susie.id, :answer_choice_id => b1.id)
#
# Response.create!(:respondent_id => buck.id, :answer_choice_id => b2.id)
# Response.create!(:respondent_id => buck.id, :answer_choice_id => c1.id)

#Response.create!(:respondent_id => joe.id, :answer_choice_id => b2.id)