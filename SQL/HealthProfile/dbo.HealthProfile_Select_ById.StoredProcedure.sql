USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[HealthProfile_Select_ById]    Script Date: 9/28/2023 10:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/26/2023
-- Description:		Select Health Profile (Medications, AllergyLogs, BloodPressures, BloodSugars, Temperatures, Weights tables) by userId
-- Code Reviewer:	

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[HealthProfile_Select_ById]
							@Id INT

AS
/* -- Test Code --
	DECLARE @Id INT = 247;
	EXEC dbo.HealthProfile_Select_ById @Id
*/

BEGIN 
---------------------------Medications ---------------------
	SELECT
				m.Id as MedicationId,
				m.Name,
				m.Dose,
				m.Time,
				m.Quantity,
				ma.Id as MedicationAdministrationTypeId,
				ma.Name as MedicationAdministrationName

		FROM dbo.Medications as m
		INNER JOIN dbo.MedicationAdministrationTypes as ma
		ON ma.Id = m.MedicationAdministrationTypeId
		WHERE m.UserId = @Id;
-----------------------------------------------------------

-----------------------AllergyLogs ------------------------
	SELECT		
				a.Id as AllergyId,
				r.Id as ReactionId,
				r.Name as ReactionType,
				a.Source,
				s.Id as SeverityId,
				s.Name as Severity

		FROM dbo.AllergyLogs as a
		INNER JOIN dbo.ReactionTypes as r
		ON r.Id = a.ReactionTypeId
		INNER JOIN dbo.SeverityTypes as s
		ON s.Id = a.SeverityTypeId
		WHERE a.UserId = @Id;
-----------------------------------------------------------

-----------------------BloodPressures ---------------------
	SELECT	  
			  bp.Id as BloodPressureId,
			  bp.Systolic,
			  bp.Diastolic,
			  bp.HR
		FROM dbo.BloodPressures as bp
		WHERE bp.UserId = @Id;
-----------------------------------------------------------

-----------------------BloodSugars ------------------------
	SELECT	
			bs.Id as BloodSugarId,
			bs.Glucose
		FROM dbo.BloodSugars as bs
		WHERE bs.UserId = @Id;
------------------------------------------------------------

-----------------------Temperatures ------------------------
	SELECT 
			t.Id as TemperatureId,
			t.Temperature
		FROM dbo.Temperatures as t
		WHERE t.UserId = @Id;
------------------------------------------------------------

-----------------------Weights -----------------------------
	SELECT 
			w.Id as WeightId,
			w.Weight
		FROM dbo.Weights as w
		WHERE w.UserId = @Id;
------------------------------------------------------------
END
GO
