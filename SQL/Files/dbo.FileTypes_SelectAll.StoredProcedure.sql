USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[FileTypes_SelectAll]    Script Date: 8/29/2023 4:53:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Patricia Dinh
-- Create date: 08/24/2023
-- Description: Select all files types that currently exist in dbo.FileTypes. This is a lookup table.
-- Code Reviewer:

-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[FileTypes_SelectAll]

AS
/* -- Test Code --
	Execute [dbo].[FileTypes_SelectAll]
*/
BEGIN
	SELECT [Id]
		  ,[Name]
	  FROM [dbo].[FileTypes]

END


GO
