require 'spec_helper'

require_relative '../lib/ally/detector/email'

describe Ally::Detector::Email do
  context 'detect email address' do
    it 'simple case' do
      subject.inquiry('joe.doe@gmail.com').detect.should == ['joe.doe@gmail.com']
    end

    it 'in a sentence' do
      subject.inquiry('Here is a made up emails address, chad.barraford@test.ly')
        .detect.should == ['chad.barraford@test.ly']
    end

    it 'in a sentence with puncuation' do
      subject.inquiry('Can we see the email with punc cbarraford+testing@dla.net?')
        .detect.should == ['cbarraford+testing@dla.net']
    end

    it 'in all caps' do
      subject.inquiry('lets try with caps ELEPHANTEMAIL@ELLE.GOV')
        .detect.should == ['ELEPHANTEMAIL@ELLE.GOV']
    end

    it 'when none exists' do
      subject.inquiry('cat@dog@mouse.com is an invalid email address')
        .detect.should == nil
      subject.inquiry('this, cat@com, is not an email address')
        .detect.should == nil
      subject.inquiry('email address with spaces like cat @dog.ci are not valid')
        .detect.should == nil
    end
  end
end
