def method_name
  params.each do |key, value|
    if key =~ /var\d+/
      values_array << value
    end

  end
end
