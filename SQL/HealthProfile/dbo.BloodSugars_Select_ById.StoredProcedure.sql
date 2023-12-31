USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[BloodSugars_Select_ById]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patricia Dinh
-- Create date: 09/06/2023
-- Description:	Selects by Blood Sugar Id
-- Code Reviewer: 

-- MODIFIED BY: 
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[BloodSugars_Select_ById]
						@Id INT

AS
/* -- Test Code --
	DECLARE @Id INT = 2

	EXEC dbo.[BloodSugars_Select_ById] @Id
*/
BEGIN 

SELECT		 [Id]
			,[UserId]
			,[Glucose]
			,[DateCreated]
			,[DateModified]

  FROM [dbo].[BloodSugars]
  WHERE Id = @Id
END




GO
