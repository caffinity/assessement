

teacher = FactoryBot.create(:teacher)
classroom = FactoryBot.create(:classroom, teacher: teacher)
7.times {
  student = FactoryBot.create(:student, classroom: classroom)
}
