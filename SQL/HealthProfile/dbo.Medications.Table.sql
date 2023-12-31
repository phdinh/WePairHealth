USE [wepairhealth]
GO
/****** Object:  Table [dbo].[Medications]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Dose] [nvarchar](400) NOT NULL,
	[Time] [time](7) NOT NULL,
	[Quantity] [nvarchar](400) NOT NULL,
	[MedicationAdministrationTypeId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Medications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medications] ADD  CONSTRAINT [DF_Medications_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Medications] ADD  CONSTRAINT [DF_Medications_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Medications]  WITH CHECK ADD  CONSTRAINT [FK_Medications_MedicationAdministrationTypes] FOREIGN KEY([MedicationAdministrationTypeId])
REFERENCES [dbo].[MedicationAdministrationTypes] ([Id])
GO
ALTER TABLE [dbo].[Medications] CHECK CONSTRAINT [FK_Medications_MedicationAdministrationTypes]
GO
ALTER TABLE [dbo].[Medications]  WITH CHECK ADD  CONSTRAINT [FK_Medications_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Medications] CHECK CONSTRAINT [FK_Medications_Users]
GO
