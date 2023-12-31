USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Files_SelectAll]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Patricia Dinh
-- Create date: 08/24/2023
-- Description: Selects all files and their corresponding files types, from all users from dbo.Files
-- Code Reviewer:

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Files_SelectAll] 

AS
/* -- Test Code --
	Execute dbo.Files_SelectAll
*/
BEGIN
	SELECT f.[Id]
		  ,f.[Name]
		  ,f.[Url]
		  ,ft.[Id] AS FileTypeId
		  ,ft.[Name] 
		  ,f.[IsDeleted]
		  ,CreatedBy = dbo.fn_GetUserJSON(u.id)
		  ,f.[DateCreated]

	  FROM [dbo].[Files] AS f INNER JOIN dbo.FileTypes AS ft
			ON  f.FileTypeId = ft.Id 
		INNER JOIN dbo.Users AS u
			ON u.Id = f.CreatedBy
	  ORDER BY f.Id
END


GO
