require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Write your test below
  # it will be easier to test this controller with factory bot
    # you would have to add the gem and configure it.
    let(:valid_attributes) {
      {
      school_id: 1,
      name: "bob",
      student_number: 5,
      gpa: 3.0
      }
    }

    let(:invalid_attributes) {
      {
        school_id: 0,
        name: "",
        student_number: 5,
        gpa: 3.0
      }
    }

    describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
        @student = FactoryBot.create(:student)
      get :show, params: { id: student.id, school_id: school.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
        @student = FactoryBot.create(:student)
      get :edit, params: { id: student.id, school_id: school.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
  context "with valid params" do
    it "creates new school" do
      expect {
        post :create, params: { student: valid_attributes, school_id: school.id}
    }.to change(Student, :count).by(1)
    end

  it "redirects to the created school" do
    post :create, params: { student: valid_attributes, school_id: school.id}
    expect(response).to redirect_to(Student.last)
  end
  end

  context "with invalid params" do
    it "does not create a new school" do
      expect {
          post :create, params: { student: invalid_attributes, school_id: school.id }
        }.to change(Student, :count).by(0)
    end
  
    it "redirects to new template" do
      post :create, params: { student: invalid_attributes, school_id: school.id }
      expect(response).to be_successful
    end
  end
end

describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { student_number: 9 }
      }

      it "update the student" do
          @student = FactoryBot.create(:student)
        put :update, params: {id: student.id, school_id: school.id, student: new_attributes }
        student.reload
        expect(student.student_number).to eq(new_attributes[:student_number])
      end

      it "redirect to the school updated" do
          @student = FactoryBot.create(:student)
        put :update, params: {id: student.id, student: valid_attributes, school_id: school.id }
        expect(response).to redirect_to(student)
      end
    end

    context "with invalid params" do
      it "does not update the student" do
          @student = FactoryBot.create(:student)
        put :update, params: {id: student.id, student: invalid_attributes, school_id: school.id }
        student.reload
        expect(student.name).to_not eq(invalid_attributes[:name])
      end

      it "redirect to the edit form" do
          @student = FactoryBot.create(:student)
        put :update, params: {id: student.id, student: invalid_attributes, school_id: school.id }
        expect(response).to be_successful
      end
    end
  end

   describe "DELETE #destroy" do
    it "destroys the requested school" do
        @student = FactoryBot.create(:student)
      expect {
        delete :destroy, params: {id: student.id, school_id: school.id}
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the school list" do
        @student = FactoryBot.create(:student)
      delete :destroy, params: {id: student.id, school_id: school.id}
      expect(response).to redirect_to(students_url)
    end
  end
end
