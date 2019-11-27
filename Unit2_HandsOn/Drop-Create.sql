USE dj0803805;
GO



/**************************
-- RUN THIS QUERY FIRST! --
**************************/

/*
DROP TABLE tr_Tracks;
DROP TABLE tr_Releases;
DROP TABLE tr_Artists;
*/

CREATE TABLE tr_Artists (
	ArtistID INT IDENTITY(1,1) PRIMARY KEY,
	ArtistName VARCHAR(50) NOT NULL,
	Notes VARCHAR(255)
);

CREATE TABLE tr_Releases (
	ReleaseID INT IDENTITY(1,1) PRIMARY KEY,
	ArtistID INT NOT NULL FOREIGN KEY REFERENCES tr_Artists,
	AlbumName VARCHAR(50) NOT NULL,
	AlbumReleaseDate DATE
);

CREATE TABLE tr_Tracks (
	TrackID INT IDENTITY(1,1) PRIMARY KEY,
	ReleaseID INT NOT NULL FOREIGN KEY REFERENCES tr_Releases,
	SongName VARCHAR(50) NOT NULL,
	SongLength INT
);

