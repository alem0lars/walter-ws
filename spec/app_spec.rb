require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'Walter Webservice' do

  describe "#send_email" do
    before do
      Pony.stub!(:deliver)
    end

    let(:to) { 'dest.test@example.com' }
    let(:from) { 'src.test@example.com' }
    let(:subject) { 'A testing email' }
    let(:body) { 'You should receive me' }


    it "should send an email" do
      Pony.should_receive(:mail) { |params|
        params[:to].should == to
        params[:from].should == from
        params[:subject].should == subject
        params[:body].should == body
      }

      post '/services/send-email',
           params = { :to => to, :from => from, :subject => subject, :body => body }

      last_response.should be_ok, "Got body: #{last_response.body}"
      last_response['Content-Type'].should include('application/json'),
                                           "Got header: #{last_response.header}"

      result = JSON.parse(last_response.body).to_hash

      result.should have_key('sent'), "Invalid response: #{result}"
      result.should have_key('error_code'), "Invalid response: #{result}"
      result['sent'].should be_true, "Email not sent. Error: #{result['error_code']}"
      result['error_code'].should be_nil, "Got an error: #{result['error_code']}"

    end

  end

end
