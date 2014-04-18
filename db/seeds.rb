joe = User.create!(:user_name => "Joe User")
susie = User.create!(:user_name => "Susie Q")

ned = User.create!(:user_name => "Ned")
buck = User.create!(:user_name => "Buck")


a = Poll.create!(:title => "Favorite Day of the Week", :author_id => joe.id)
b = Poll.create!(:title => "Favorite Breakfast Food", :author_id => joe.id)
c = Poll.create!(:title => "Apocalypse Now?", :author_id => susie.id)

q1 = Question.create!(:body => "What is your favorite breakfast food?", :poll_id => b.id)
q2 = Question.create!(:body => "Who is your favorite Apocalypse Now character?", :poll_id => c.id)

b1 = AnswerChoice.create!(:answer_choice => "Waffles", :question_id => q1.id)
b2 = AnswerChoice.create!(:answer_choice => "Pancakes", :question_id => q1.id)
c1 = AnswerChoice.create!(:answer_choice => "Marlon Brando", :question_id => q2.id)
c2 = AnswerChoice.create!(:answer_choice => "Robert Duvall", :question_id => q2.id)

Response.create!(:respondent_id => ned.id, :answer_choice_id => c1.id)
Response.create!(:respondent_id => ned.id, :answer_choice_id => b1.id)

Response.create!(:respondent_id => susie.id, :answer_choice_id => b1.id)

Response.create!(:respondent_id => buck.id, :answer_choice_id => b2.id)
Response.create!(:respondent_id => buck.id, :answer_choice_id => c1.id)

#Response.create!(:respondent_id => joe.id, :answer_choice_id => b2.id)