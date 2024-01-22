PATTERN = /^[4|5]\d{15}$/

def credit_card_check(credit_card_number)
  credit_card_number.gsub!(' ', '')

  if credit_card_number.match?(PATTERN) && valid_luhn?(credit_card_number)
    "Valid #{credit_card_number[0] == '4' ? 'Visa' : 'Mastercard'} credit card number"
  else
    "Invalid credit card number"
  end
end

def valid_luhn?(credit_card_number)
  sum = 0
  credit_card_number.split('').map(&:to_i).each_with_index do |digit, index|
    sum += (index.even? ? (digit * 2) % 9 : digit)
  end
  (sum % 10).zero?
end
