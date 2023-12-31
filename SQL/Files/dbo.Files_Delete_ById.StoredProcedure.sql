USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Files_Delete_ById]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Patricia Dinh
-- Create date: 08/24/2023
-- Description: Soft delete from dbo.Files, changes column value of [isDeleted] to 'true'
-- Code Reviewer:

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Files_Delete_ById]
			@Id INT

AS
/* -- Test Code --
	Declare @Id INT = 24;

	Select Name
	from dbo.Files
	Where Id = @Id

	Execute dbo.Files_Delete_ById @Id

	Select Name
	from dbo.Files
	Where Id = @Id
	
*/
BEGIN
	DECLARE @ToDelete bit;
	SET @ToDelete = 'true'

	--soft delete logic from Files Table
	UPDATE dbo.Files
	SET [IsDeleted] = @ToDelete
		WHERE Id = @Id;
END




GO
