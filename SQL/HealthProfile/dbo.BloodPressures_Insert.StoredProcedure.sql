USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[BloodPressures_Insert]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/05/2023
-- Description:		Insert procedure for BloodPressure table
-- Code Reviewer:	

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[BloodPressures_Insert]
			@UserId INT,
            @Systolic INT,
            @Diastolic INT,
            @HR INT,
			@Id INT OUTPUT
           
AS
/* -- Test Code --
	DECLARE @Id INT = 0;
			
	DECLARE	@UserId INT = 2,
			@Systolic INT = 110,
			@Diastolic INT = 70,
			@HR INT = 75


	EXEC dbo.BloodPressures_Insert
			@UserId,
			@Systolic,
			@Diastolic,
			@HR,
			
			@Id OUTPUT

	SELECT UserId, Systolic, Diastolic, HR
	FROM dbo.BloodPressures
	WHERE Id = @Id;
*/
BEGIN

	INSERT INTO [dbo].[BloodPressures] (
						[UserId],
						[Systolic],
						[Diastolic],
						[HR]
				) VALUES (
					   @UserId, 
					   @Systolic, 
					   @Diastolic, 
					   @HR
				);

	SET @Id = SCOPE_IDENTITY()
END




GO
