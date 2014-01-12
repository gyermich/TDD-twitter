require 'spec_helper'

describe TweetsController do
  let(:tweet){ create(:tweet) }
  let(:tweet2){ create(:tweet2) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "populates an array of tweets" do
      get 'index'
      expect(assigns(:tweets).first).to be_an_instance_of Tweet
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET 'show'" do
    it "assigns the requested tweet to @tweet" do
      get 'show', id: tweet.id
      assigns(:tweet).should eq(tweet)
    end

    it "renders the :show template" do
      get :show, id: tweet.id
      response.should render_template :show
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "assigns a new tweet to @tweet" do
      get :new
      assigns(:tweet).should eq(tweet)
    end

    it "renders the :new template" do
      response.should render_template :new
    end
  end

  describe "POST 'create'" do

    context "when valid do" do
      it "saves the new tweet in the database" do
        post :create
        expect(assigns(:tweet)).to be_a Tweet
      end

      it "redirects to the home page" do
        post :create, :tweet
        expect(response).to redirect_to root_path
      end
    end

    context "when invalid" do

      it "renders :new template" do
        post :create, tweet: Factory.attributes_for(:invalid_tweet)
        expect(response).to render_template :new
      end
    end
  end
end
