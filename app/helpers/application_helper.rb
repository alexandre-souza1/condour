module ApplicationHelper
  def formatted_phone_number(phone_number)
    "(#{phone_number[0..1]}) #{phone_number[2..6]}-#{phone_number[7..-1]}"
  end
end
