USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[Medications_Insert]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/05/2023
-- Description:		Insert procedure for Medications table
-- Code Reviewer:	

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[Medications_Insert]
				@UserId INT,
				@Name NVARCHAR(200),
				@Dose NVARCHAR(400),
				@Time TIME(7),
				@Quantity NVARCHAR(400),
				@MedicationAdministrationTypeId INT,
				@Id INT OUTPUT
AS

/* -- Test Code --
	DECLARE @Id INT = 0;

	DECLARE @UserId INT = 2,
			@Name NVARCHAR(200) = 'Claritin',
			@Dose NVARCHAR(400) = 'Loratadine 10mg',
			@Time TIME(7) = '13:45:00',
			@Quantity NVARCHAR(400) = '45 tablets',
			@MedicationAdministrationTypeId INT = 1

	EXEC dbo.Medications_Insert
			@UserId,
			@Name,
			@Dose,
			@Time,
			@Quantity,
			@MedicationAdministrationTypeId,

			@Id OUTPUT

	SELECT Name, Quantity
	FROM dbo.Medications
	WHERE Id = @Id

*/
BEGIN

	INSERT INTO [dbo].[Medications] (
					   [UserId],
					   [Name],
					   [Dose],
					   [Time],
					   [Quantity],
					   [MedicationAdministrationTypeId]
				) VALUES (
					   @UserId,
					   @Name,
					   @Dose, 
					   @Time,
					   @Quantity,
					   @MedicationAdministrationTypeId
			   );

    SET @Id = SCOPE_IDENTITY()
END




GO
