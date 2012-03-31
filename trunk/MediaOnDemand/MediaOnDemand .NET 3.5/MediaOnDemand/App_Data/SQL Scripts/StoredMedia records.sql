USE [C:\HOSTEDWEBSITES\MEDIAONDEMAND\APP_DATA\MEDIAONDEMANDDB.MDF];
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

SET IDENTITY_INSERT [dbo].[StoredMedia] ON;

BEGIN TRANSACTION;
INSERT INTO [dbo].[StoredMedia]([medTitle], [medLocation], [medDateAdded], [medIsViewable], [medArtist], [medDescription], [medId], [medGenre], [medMediaType], [medDuration], [medAlbum], [medVideoType], [medFileExt], [medPosterImageUrl], [medLastPlayedDate], [medRating])
SELECT N'The Missing', N'\\mediaserver\mediafiles\videos\movie\Western\mpg\The Missing.vob', '20110529 23:56:18.467', N'Y', N'', N'', 163516, N'Western', N'movie     ', 