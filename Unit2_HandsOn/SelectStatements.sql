USE dj0803805;
GO

/*************************
-- RUN THIS QUERY LAST! --
*************************/

SELECT * FROM tr_Artists
	ORDER BY ArtistName;

SELECT * FROM tr_Releases
	ORDER BY AlbumReleaseDate;

SELECT TOP 10 * FROM tr_Tracks
	ORDER BY SongLength;