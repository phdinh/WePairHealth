USE [wepairhealth]
GO
/****** Object:  UserDefinedTableType [dbo].[BatchMedicationsV2]    Script Date: 9/28/2023 10:57:06 AM ******/
CREATE TYPE [dbo].[BatchMedicationsV2] AS TABLE(
	[Name] [nvarchar](200) NOT NULL,
	[Dose] [nvarchar](400) NOT NULL,
	[Time] [time](7) NOT NULL,
	[Quantity] [nvarchar](400) NOT NULL,
	[MedicationAdministrationTypeId] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
