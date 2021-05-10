CREATE or ALTER PROCEDURE Fibonacci(@fib int)
	AS
		BEGIN
			DECLARE @n1 int = 0, @n2 int = 0, @n3 int = 1, @i int = 0
			WHILE(@i < @fib)
			BEGIN
				Print @n1 + ' '
				Set @n2 = @n3
				Set @n3 = @n1
				Set @n1 = @n2 + @n3
				Set @i += 1
			END
		END
EXEC Fibonacci @fib = 12
