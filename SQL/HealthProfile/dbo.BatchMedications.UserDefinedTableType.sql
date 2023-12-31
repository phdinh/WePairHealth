USE [wepairhealth]
GO
/****** Object:  UserDefinedTableType [dbo].[BatchMedications]    Script Date: 9/7/2023 2:00:32 PM ******/
CREATE TYPE [dbo].[BatchMedications] AS TABLE(
	[Name] [nvarchar](200) NOT NULL,
	[Dose] [nvarchar](400) NOT NULL,
	[Time] [time](7) NOT NULL,
	[Quantity] [nvarchar](400) NOT NULL,
	[MedicationAdministrationTypeId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
