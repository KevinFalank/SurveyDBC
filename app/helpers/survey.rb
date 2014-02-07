def generate_answers(params)
  values_array = []
  params.each do |key, value|
    values_array << value if key =~ /var\d+/
  end
  values_array
end
