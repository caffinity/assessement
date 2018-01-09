

teacher = FactoryBot.create(:teacher)
classroom = FactoryBot.create(:classroom, teacher: teacher)
7.times{FactoryBot.create(:student, :with_skill_level, classroom: classroom )}
