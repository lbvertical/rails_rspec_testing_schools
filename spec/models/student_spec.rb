require 'rails_helper'

RSpec.describe Student, type: :model do
  # write your student model here
  describe 'attributes' do
    it 'has a name' do
      name = 'Bob'
      student = Student.create(name: name)
      expect(student.name).to eq(name)
    end
    it 'has a student number' do
      student_number = 5
      student = Student.create(student_number: student_number)
      expect(student.student_number).to eq(student_number)
    end
    it 'has a gpa' do
      gpa = 3.0
      student = Student.create(gpa: gpa)
      expect(student.gpa).to eq(gpa)
    end
   end

  describe 'validations' do
    #  it { should validate_uniqueness_of :name }
    it { should validate_presence_of :name }
    it { should validate_presence_of :student_number }
    it { should validate_presence_of :gpa }
  end

  # describe 'has student number lower bound' do
  #   should validate_numericality_of(:student_number).
  #     is_greater_than_or_equal_to(0)
  # end

  # describe 'has student number higher bound' do
  #   should validate_numericality_of(:student_number).
  #     is_less_than_or_equal_to(10000)
  # end

  describe 'association' do
    it { should belong_to(:school) }
  end

  # describe "uniqueness" do
  #   Student.create!(name: 'foo', student_number: 123, gpa: 3.0)
  #   subject { Student.new(name: 'foo', student_number: 123, gpa: 3.0) }
  #   it { should validate_uniqueness_of(:name) }
  # end

  describe "numericality" do
    before(:each) do
      @student = Student.create(name: 'foo', student_number: 123, gpa: 1.5)
    end
    
     it { should validate_numericality_of(:student_number) }
  end 

end 