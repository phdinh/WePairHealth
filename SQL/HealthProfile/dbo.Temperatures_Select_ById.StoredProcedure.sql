USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Temperatures_Select_ById]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patricia Dinh
-- Create date: 09/06/2023
-- Description:	Selects by Temperature Id
-- Code Reviewer: 

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Temperatures_Select_ById]
					@Id INT
AS
/* -- Test Code --
	DECLARE @Id INT = 2

	EXEC dbo.Temperatures_Select_ById @Id

*/
BEGIN

	SELECT		 t.[Id]
				,u.[Id]
				,u.[FirstName]
				,t.[Temperature]
				,t.[DateCreated]
				,t.[DateModified]

	FROM [dbo].[Temperatures] as t
	INNER JOIN dbo.Users as u
			on t.UserId = u.Id
	WHERE t.Id = @Id

END





GO
