USE [wepairhealth]
GO
/****** Object:  UserDefinedTableType [dbo].[BatchAllergyLogs]    Script Date: 9/7/2023 2:00:32 PM ******/
CREATE TYPE [dbo].[BatchAllergyLogs] AS TABLE(
	[ReactionTypeId] [int] NOT NULL,
	[Source] [nvarchar](250) NOT NULL,
	[SeverityTypeId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Source] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
