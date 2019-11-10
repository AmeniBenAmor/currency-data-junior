require 'spec_helper'

describe ApplicationController do
  it "works!" do
    get '/'
    expect(last_response.status).to eq 200
  end

  it "page history works" do
    get '/history'
    expect(last_response.status).to eq 200
  end
  
  
  it "post with empty parameters" do
    params= { amount: '', from:'',to:''}
    
    post ('/') , params
    expect(last_response.status).to eq 500
     end

  it "post without parameters" do

      post ('/') 
      expect(last_response.status).to eq 500
      end

    it "post with all param" do
      params= { amount: '1', from:'USD',to:'EUR'}
      
      post ('/') , params
      get :Convert
      assigns().should eq('€0.91')

      end
      

end
