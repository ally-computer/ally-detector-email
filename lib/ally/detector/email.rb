require 'ally/detector'
require 'ally/detector/email/version'

module Ally
  module Detector
    class Email
      include Ally::Detector

      def detect
        @email_addresses = []
        @inquiry.words_chomp_punc.each do |word|
          if word =~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
            @email_addresses << word
            @data_detected = true
          end
        end
        if @email_addresses.length == 0 ?
          nil
        else
          @data_detected = true
          @email_addresses
        end
      end
    
    end
  end
end
