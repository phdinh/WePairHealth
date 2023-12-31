USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Weights_Select_ById]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patricia Dinh
-- Create date: 09/06/2023
-- Description:	Selects by Weight Id 
-- Code Reviewer: 

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Weights_Select_ById]
					@Id INT

AS

/* -- Test Code --
	DECLARE @Id INT = 2

	EXEC dbo.Weights_Select_ById @Id
*/

BEGIN

	SELECT		 w. [Id] as WeightId
				,u.[Id] as UserId
				,u.[FirstName]
				,w.[Weight]
				,w.[DateCreated]
				,w.[DateModified]

	FROM dbo.Weights as w
	INNER JOIN dbo.Users as u
				on w.UserId = u.Id
	WHERE w.Id = @Id

END
GO
