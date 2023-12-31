USE [wepairhealth]
GO
/****** Object:  StoredProcedure [dbo].[HealthProfile_Insert]    Script Date: 9/28/2023 10:57:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:			Patricia Dinh
-- Create date:		09/07/2023
-- Description:		Insert procedure for Medications, AllergyLogs, BloodPressures, BloodSugars, Temperatures, Weights table
-- Code Reviewer:	

-- MODIFIED BY:
-- MODIFIED DATE:
-- Code Reviewer:
-- Note:
-- =============================================
CREATE PROC [dbo].[HealthProfile_Insert]
------------Medications --------------------
				@BatchMedications dbo.BatchMedicationsV3 READONLY,  
-------------------------------------------

----------------AllergyLogs----------------
				@BatchAllergyLogs dbo.BatchAllergyLogsV2 READONLY,
--------------------------------------------

----------------BloodPressures ------------
				@Systolic INT,
				@Diastolic INT,
				@HR INT,
-------------------------------------------

----------------BloodSugars ---------------
				@Glucose INT,
-------------------------------------------

----------------Temperatures --------------
				@Temperature DECIMAL(18,2),
-------------------------------------------

----------------Weights -------------------
				@Weight DECIMAL(18,2),
-------------------------------------------

-------------------IDs----------------------
				@UserId INT
-------------------------------------------

AS

/* -- Test Code -- 

DECLARE		@Systolic INT = 115,
			@Diastolic INT = 85,
			@HR INT = 90,
			@Glucose INT = 88,
			@Temperature DECIMAL(18,2) = 98.6,
			@Weight DECIMAL(18,2) = 130.4,

		    @UserId INT = 8,
			@BatchMedications dbo.BatchMedicationsV3,
			@BatchAllergyLogs dbo.BatchAllergyLogsV2;

	INSERT INTO @BatchMedications (Name, Dose, Time, Quantity, MedicationAdministrationTypeId)
	VALUES 
			('Allegro', 'Ibuprofen 200mg', 'Every 10 hours', '300 tablets', 1),
			('Xanax', 'Alprazolam 0.5mg', 'Twice a day', '60 tablets', 1),
			('Robitussin', 'Dextromethorphan 20ml', 'Take throughout the day as needed', '8 fl oz', 4);

	INSERT INTO @BatchAllergyLogs (ReactionTypeId, Source, SeverityTypeId)
	VALUES
			(4, 'Penicillin', 3),
			(2, 'Latex', 1),
			(8, 'Grass', 2),
			(5, 'Mold', 3);

	EXEC dbo.HealthProfile_Insert
							-- UDT params
							@BatchMedications,
							@BatchAllergyLogs,

							--Other params
							@Systolic,
							@Diastolic,
							@HR,
							@Glucose,
							@Temperature,
							@Weight,

							--ids
							@UserId;

*/

BEGIN

SET XACT_ABORT ON
Declare @Tran nvarchar(50)  = 'HealthProfile_Insert_Trans'

BEGIN TRY

BEGIN Transaction @Tran

---------------------------Medications ------------------------

		----------UDT----------------
		INSERT INTO dbo.Medications (  
							[UserId], 
							[Name],
							[Dose],
							[Time],
							[Quantity],
							[MedicationAdministrationTypeId] 
					)

		-- BatchMedications is preventing duplicates from being inserted
		SELECT 
				@UserId,
			    bm.Name,
			    bm.Dose,
			    bm.Time,
			    bm.Quantity,
			    bm.MedicationAdministrationTypeId

			    FROM @BatchMedications AS bm WHERE NOT EXISTS (
			    -- if medication dne, add to db, if it DOES exist, don't add to db
				-- where there is a match, add medication table to medication Id
				-- assoc med name and a user id to prevent rejected meds for the same med, for a different user id
											SELECT 1
											FROM dbo.Medications AS m
											WHERE m.Name = bm.Name AND
												  m.Dose = bm.Dose AND
												  m.Time = bm.Time AND
												  m.Quantity = bm.Quantity AND
												  m.MedicationAdministrationTypeId = bm.MedicationAdministrationTypeId
											) 
-----------------------------------------------------------

-----------------------AllergyLogs ------------------------

		----------UDT----------------
		INSERT INTO [dbo].[AllergyLogs] (
							[UserId],
							[ReactionTypeId], 
							[Source],
							[SeverityTypeId]
						) 
		SELECT
			@UserId,
			ba.ReactionTypeId,
			ba.Source,
			ba.SeverityTypeId

			FROM @BatchAllergyLogs AS ba WHERE NOT EXISTS (
										 SELECT 1
										 FROM dbo.AllergyLogs as a
										 WHERE a.ReactionTypeId = ba.ReactionTypeId AND
											   a.Source = ba.Source AND
											   a.SeverityTypeId = ba.SeverityTypeId
										)
		
------------------------------------------------------------

-----------------------BloodPressures ----------------------
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

------------------------------------------------------------

-----------------------BloodSugars ------------------------
		INSERT INTO [dbo].[BloodSugars] (
							[UserId],
							[Glucose]
					) VALUES (
							@UserId, 
							@Glucose
					);

------------------------------------------------------------

-----------------------Temperatures ------------------------
		INSERT INTO [dbo].[Temperatures] (
							[UserId],
							[Temperature]
					) VALUES (
							@UserId, 
							@Temperature
					);

------------------------------------------------------------

-----------------------Weights ----------------------------
		INSERT INTO [dbo].[Weights] (
							[UserId],
							[Weight]
					) VALUES (
							@UserId, 
							@Weight
					);

-----------------------------------------------------------

Commit Transaction @Tran

END TRY
BEGIN Catch



    IF (XACT_STATE()) = -1
    BEGIN
        PRINT 'The transaction is in an uncommittable state.' +
              ' Rolling back transaction.'
        ROLLBACK TRANSACTION @Tran;;
    END;

    -- Test whether the transaction is active and valid.
    IF (XACT_STATE()) = 1
    BEGIN
        PRINT 'The transaction is committable.' +
              ' Committing transaction.'
        COMMIT TRANSACTION @Tran;;
    END;

        -- If you want to see error info
      --  SELECT
        --ERROR_NUMBER() AS ErrorNumber,
        --ERROR_SEVERITY() AS ErrorSeverity,
        --ERROR_STATE() AS ErrorState,
        --ERROR_PROCEDURE() AS ErrorProcedure,
        --ERROR_LINE() AS ErrorLine,
       --- ERROR_MESSAGE() AS ErrorMessage

-- to just get the error thrown and see the bad news as an exception
    THROW 

End Catch

SET XACT_ABORT OFF



END




GO
