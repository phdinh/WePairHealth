USE [wepairhealth]
GO
/****** Object:  Table [dbo].[Weights]    Script Date: 9/7/2023 2:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Weight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Weights] ADD  CONSTRAINT [DF_Weight_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Weights] ADD  CONSTRAINT [DF_Weight_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Weights]  WITH CHECK ADD  CONSTRAINT [FK_Weight_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Weights] CHECK CONSTRAINT [FK_Weight_Users]
GO
