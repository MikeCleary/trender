require 'spec_helper'

describe CommentsController do
  before do 
    @reader = Reader.make!(:bruce)
    @reading_list = ReadingList.make!(:vanilla)
  end
  context "create" do 
    

    context "valid data" do
      before do
        session[:logged_in] = true
        session[:reader_id] = @reader.id
        params = {
          :format => "js",
          :reading_list_id => @reading_list.id,
          :comment => {:body => "An informed and measured comment"}
        }
        post :create, params
        @comment = Comment.last
      end

      it "should create a comment" do 
        (@comment.body).should eq("An informed and measured comment")
      end

      it "should associate it with the reader and reading_list" do 
        (@comment.reading_list.id).should eq(@reading_list.id)
        (@comment.reader_id).should eq(@reader.id)
      end
    end

    context "not logged in" do 
      before do
        session[:reader_id] = @reader.id
        request.env["HTTP_REFERER"] = reading_list_path(@reading_list)

        params = {
          :format => "js",
          :reading_list_id => @reading_list.id,
          :comment => {:body => "An informed and measured comment"}
        }
        post :create, params
      end

      it "should not create a comment" do 
        expect(Comment.count).to eq(0)
      end

      it "should generate a flash message" do 
        expect(flash[:notice]).to eq("You must log in to comment")
      end
    end
    context "no body" do
      before do 
        session[:logged_in] = true
        session[:reader_id] = @reader.id
        params = {
          :format => "js",
          :reading_list_id => @reading_list.id,
          :comment => {:body => ""}
        }
        post :create, params
      end

      it "should not create a comment" do 
        expect(Comment.count).to eq(0)
      end

      it "should not return a flash message" do 
        expect(flash[:notice]).to eq("Body can't be blank")
      end       
    end
  end

  context "creating a reply" do
    before do 
      @comment = Comment.create(
        :body => "An informed and measured comment",
        :reading_list_id => @reading_list.id,
        :reader_id => @reader.id
      )
      session[:logged_in] = true
      session[:reader_id] = @reader.id
      params = {
        :format => "js",
        :reading_list_id => @reading_list.id,
        :comment => {
          :body => "An informed and measured reply",
          :parent_id => @comment.id
        }
      }
      post :create, params
      @reply = Comment.last
    end

    it "should create a reply" do 
      expect(Comment.count).to eq(2)
    end

    it "should associate the reply with its parent comment" do 
      expect(@reply.parent_id).to eq(@comment.id)
      expect(@reply.in_reply_to).to eq(@comment.reader.name)
    end
  end
end
