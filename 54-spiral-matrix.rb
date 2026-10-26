# 54. Spiral Matrix
# https://leetcode.com/problems/spiral-matrix/

# Given an m x n matrix, return all elements of the matrix in spiral order.

# Example 1:
# Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [1,2,3,6,9,8,7,4,5]


# Example 2:
# Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
# Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 

# Constraints:
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 10
# -100 <= matrix[i][j] <= 100


# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
    height = matrix.size
    width = matrix.first.size

    return matrix if matrix == [[]]
    return matrix[0][0] if (height == 1 && width == 1)

    cursor = { x: 0, y: 0 }
    dir = :right

    left_indent = 0
    right_indent = 0

    top_indent = 0
    bottom_indent = 0

    no_more = false

    output = []

    until no_more do
        case dir
        when :right
            new_x = width-right_indent-1
            
            (cursor[:x]..new_x).each do |x|
                output << matrix[cursor[:y]][x]
            end

            top_indent += 1
            cursor[:x] = new_x
            cursor[:y] = cursor[:y] + 1
            dir = :down
        when :left
            new_x = left_indent

            cursor[:x].downto(new_x).each do |x|
                output << matrix[cursor[:y]][x]
            end

            bottom_indent += 1
            cursor[:x] = new_x
            cursor[:y] = cursor[:y] - 1
            dir = :up
        when :down
            new_y = height-bottom_indent-1

            (cursor[:y]..new_y).each do |y|
                output << matrix[y][cursor[:x]]
            end

            right_indent += 1
            cursor[:y] = new_y
            cursor[:x] = cursor[:x] - 1
            dir = :left
        when :up
            new_y = top_indent

            cursor[:y].downto(top_indent).each do |y|
                output << matrix[y][cursor[:x]]
            end

            left_indent += 1
            cursor[:y] = new_y
            cursor[:x] = cursor[:x] + 1
            dir = :right
        end


        x_movement = width - left_indent - right_indent
        y_movement = height - top_indent - bottom_indent


        no_more = x_movement <= 0 || y_movement <= 0
    end

    output
end