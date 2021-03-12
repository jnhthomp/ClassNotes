# Get info used for title
print "Lesson number: "
lesson_number = gets.chomp
print "Lesson Title: "
lesson_title = gets.chomp

# Create title card
# Create middle row
spacer = 12
row_mid = "#" + (" " * spacer) + "#{lesson_number}. #{lesson_title}" + (" " * spacer) + "#"
# Create top and bottom row (identicle)
row_border = "#" + ("=" * (row_mid.length - 2)) + "#"
puts row_border
puts row_mid
puts row_border

   