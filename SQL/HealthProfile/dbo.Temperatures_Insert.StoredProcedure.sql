USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Temperatures_Insert]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/05/2023
-- Description:		Insert procedure for Temperature table
-- Code Reviewer:	Armando Castaneda

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Temperatures_Insert]
				@UserId INT,
				@Temperature DECIMAL(18,2),
				@Id INT OUTPUT
				
AS
/* --Test Code -- 
	DECLARE @Id INT = 0;

	DECLARE @UserId INT = 200,
			@Temperature DECIMAL = 98.5 --temperature value rounds up or down.
	
	EXEC dbo.Temperatures_Insert
			@UserId,
			@Temperature,

			@Id OUTPUT
			
	SELECT UserId, Temperature
	FROM dbo.Temperatures
	WHERE Id = @Id;

*/
BEGIN 
		INSERT INTO [dbo].[Temperatures] (
							[UserId],
							[Temperature]
					) VALUES (
							@UserId, 
							@Temperature
					);

		SET @Id = SCOPE_IDENTITY()
END




GO
