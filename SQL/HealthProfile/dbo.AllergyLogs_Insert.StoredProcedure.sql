USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[AllergyLogs_Insert]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/05/2023
-- Description:		Insert procedure for AllergyLogs table
-- Code Reviewer:	

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[AllergyLogs_Insert]
				@UserId INT,
				@ReactionTypeId INT,
				@Source NVARCHAR(250),
				@SeverityTypeId INT,
				@Id INT OUTPUT

AS

/* -- Test Code --
	DECLARE @Id INT  = 0;

	DECLARE @UserId INT = 18,
			@ReactionTypeId INT = 4,
			@Source NVARCHAR(250) = 'Eggs',
			@SeverityTypeId Int = 1

	EXEC dbo.AllergyLogs_Insert
			@UserId,
			@ReactionTypeId,
			@Source,
			@SeverityTypeId,
			
			@Id OUTPUT

	SELECT Source
	FROM dbo.AllergyLogs
	WHERE Id = @Id;

*/

BEGIN

	INSERT INTO [dbo].[AllergyLogs] (
						[UserId],
						[ReactionTypeId], 
						[Source],
						[SeverityTypeId]
				 ) VALUES (
						@UserId,
						@ReactionTypeId,
						@Source, 
						@SeverityTypeId
				);

		SET @Id = SCOPE_IDENTITY()
			
END



GO
