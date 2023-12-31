USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Weights_Insert]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/05/2023
-- Description:		Insert procedure for Weights table
-- Code Reviewer:	Armando Castaneda

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Weights_Insert]
				@UserId INT,
				@Weight DECIMAL(18,2),
				@Id INT OUTPUT
				
AS
/* -- Test Code --
	DECLARE @Id INT = 0;
			
	DECLARE	@UserId INT = 200,
			@Weight DECIMAL = 148.3

	EXEC dbo.Weights_Insert
			@UserId,
			@Weight,
			
			@Id OUTPUT

	SELECT UserId, Weight
	FROM dbo.Weights
	WHERE Id = @Id;
	
*/

BEGIN
		INSERT INTO [dbo].[Weights] (
							[UserId],
							[Weight]
					) VALUES (
							@UserId, 
							@Weight
					);

	SET @Id = SCOPE_IDENTITY()
					
END



GO
