

teacher = FactoryBot.create(:teacher)
classroom = FactoryBot.create(:classroom, teacher: teacher)
student = FactoryBot.create(:student, classroom: classroom)
