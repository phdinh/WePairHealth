USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[BloodSugars_Insert]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/05/2023
-- Description:		Insert procedure for BloodSugars table
-- Code Reviewer:	

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[BloodSugars_Insert]
				@UserId INT,
				@Glucose INT,
				@Id INT OUTPUT
				
AS
/* -- Test Code -- 
	DECLARE @Id INT = 0;
			
	DECLARE	@UserId INT = 3,
			@Glucose INT = 88

	EXEC dbo.BloodSugars_Insert
			@UserId,
			@Glucose,
			
			@Id OUTPUT

	SELECT UserId, Glucose
	FROM dbo.BloodSugars
	WHERE Id = @Id;
*/
BEGIN
		INSERT INTO [dbo].[BloodSugars] (
							[UserId],
							[Glucose]
					) VALUES (
							@UserId, 
							@Glucose
					);
		SET @Id = SCOPE_IDENTITY()
END




GO
