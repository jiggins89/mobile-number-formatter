# frozen_string_literal: true

require_relative '../../../lib/exceptions'

module Formatter
  module PhoneNumber
    # Format UK mobile numbers for use with Twilio's API
    module UK
      def self.format(number)
        stripped_number = number.delete(' ')
        prefix = find_valid_prefix(stripped_number)
        number = stripped_number[prefix.length..-1]

        validate_number_format(number)
        join_and_format_number(prefix, number)
      end

      def self.find_valid_prefix(number)
        prefix = number.scan(/\A0|44|\+44/).first

        return prefix if prefix_valid?(prefix)
      end
      private_class_method :find_valid_prefix

      def self.prefix_valid?(prefix)
        return true if ['+44', '44', '0'].include?(prefix)

        raise ValidationError, 'Phone number prefix is not valid.'
      end
      private_class_method :prefix_valid?

      def self.validate_number_format(number)
        raise ValidationError, 'Phone number format is not valid.' if invalid_format?(number)
        raise ValidationError, 'Phone number is not the correct length.' if incorrect_length?(number)
      end
      private_class_method :validate_number_format

      def self.invalid_format?(number)
        number[0] != '7'
      end
      private_class_method :invalid_format?

      def self.incorrect_length?(number)
        number.length != 10
      end
      private_class_method :incorrect_length?

      def self.join_and_format_number(prefix, number)
        full_number = prefix + number

        case prefix
        when '+44'
          full_number
        when '44'
          full_number.prepend('+')
        when '0'
          full_number.gsub(/\A0/, '+44')
        end
      end
      private_class_method :join_and_format_number
    end
  end
end
