USE [wepairhealth]
GO
/****** Object:  Table [dbo].[AllergyLogs]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllergyLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ReactionTypeId] [int] NOT NULL,
	[Source] [nvarchar](250) NOT NULL,
	[SeverityTypeId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AllergyLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllergyLogs] ADD  CONSTRAINT [DF_AllergyLog_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AllergyLogs] ADD  CONSTRAINT [DF_AllergyLog_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[AllergyLogs]  WITH CHECK ADD  CONSTRAINT [FK_AllergyLogs_ReactionTypes] FOREIGN KEY([ReactionTypeId])
REFERENCES [dbo].[ReactionTypes] ([Id])
GO
ALTER TABLE [dbo].[AllergyLogs] CHECK CONSTRAINT [FK_AllergyLogs_ReactionTypes]
GO
ALTER TABLE [dbo].[AllergyLogs]  WITH CHECK ADD  CONSTRAINT [FK_AllergyLogs_SeverityTypes] FOREIGN KEY([SeverityTypeId])
REFERENCES [dbo].[SeverityTypes] ([Id])
GO
ALTER TABLE [dbo].[AllergyLogs] CHECK CONSTRAINT [FK_AllergyLogs_SeverityTypes]
GO
ALTER TABLE [dbo].[AllergyLogs]  WITH CHECK ADD  CONSTRAINT [FK_AllergyLogs_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[AllergyLogs] CHECK CONSTRAINT [FK_AllergyLogs_Users]
GO
