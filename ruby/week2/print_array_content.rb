a = *(1..16)

# Print  four numbers at a time using only each
a.each do |number|
    p a[(number-4...number)] if number % 4 == 0
end

# Print four numbers using each_slice
a.each_slice(4) {|s| p s}

