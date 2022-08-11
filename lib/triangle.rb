#class Triangle
  # write code here
#	attr_accessor :side_1,:side_2,:side_3
#	def initialize(side_1,side_2,side_3)
#		@side_1 = side_1
#		@side_2 = side_2
#		@side_3 = side_3
#	end
#	def kind
#		if !self.is_valid
#			raise TriangleError
#		end
#		if self.side_1 == self.side_2 && self.side_2 == self.side_3
#			:equilateral
#		elsif self.side_1 == self.side_2 || self.side_1 == self.side_3 || self.side_2 == self.side_3
#			:isosceles
#		else
#			:scalene
#		end
#	end
#	def is_valid
#		return (self.side_1 > 0 && self.side_2 > 0 && self.side_3 > 0) && (self.side_1 + self.side_2 > self.side_3 && self.side_2 + self.side_3 > self.side_1 && self.side_1 + self.side_3 > self.side_2)
#	end
#	class TriangleError < StandardError
#	end
#end

class Triangle
	attr_reader :a, :b, :c
	def initialize(a,b,c)
		@a = a
		@b = b
		@c = c
	end
	def kind
		validate_triangle
		if a == b && b == c
			:equilateral
		elsif a == b || a == c || b == c
			:isosceles
		else
			:scalene
		end
	end
	def validate_triangle
		raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
	end
	def sides_greater_than_zero?
		# a > 0 && b > 0 && c > 0
		[a,b,c].all?(&:positive?)
	end
	def valid_triangle_inequality?
		a + b > c && b + c > a && a + c > b
	end
	class TriangleError < StandardError
	end

end
