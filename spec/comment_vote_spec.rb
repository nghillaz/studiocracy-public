require 'spec_helper'

describe CommentVote do
  before :all do
    @user = User.new(
      email: "test@rspec.com",
      password: "testPassword1",
      password_confirmation: "testPassword1",
      first_name: "test",
      last_name: "rspec",
      image: File.new('app/assets/images/default_icon.jpg')
    )
    @post = Post.new(
      title: "test title 123",
      user: @user,
      content_md: "test content 123",
      year_created: (1),
      medium: "test medium 123",
      dimension_height: 2,
      dimension_width: 3,
      measurement: 'in',
      weight_in_pounds: 4,
      price: 5,
      quantity: 6,
      image: File.new('app/assets/images/test.png')
    )
    @comment = Comment.new(
      message: "test comment 123",
      user_id: @user.id,
      post_id: @post.id,
      user: @user
    )
    @comment_vote = CommentVote.new(
      user: @user,
      comment: @comment
    )
  end

  describe "#new" do
    it "creates a new test CommentVote using default values" do
      expect(@comment_vote).to be_an_instance_of CommentVote
    end
  end

  describe ":comment" do
    it "returns the user of the test comment_vote" do
      expect(@comment_vote["comment"]).to be == @comment.id
    end
  end
end