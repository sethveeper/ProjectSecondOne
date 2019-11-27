USE dj0803805;
GO


/***************************
-- RUN THIS QUERY SECOND! --
***************************/

INSERT INTO tr_Artists (ArtistName, Notes)
	VALUES 
('Queen', 'Queen are a British rock band formed in London in 1970.'),
('Oingo Boingo', 'Oingo Boingo was an American new wave band, formed by songwriter Danny Elfman in 1979.'),
('Steam Powered Giraffe', 'Steam Powered Giraffe (SPG) is an American steampunk musical comedy project formed in San Diego in 2008, self-described as "a musical act that combines robot pantomime, puppetry, ballet, comedy, projections, and music".');

INSERT INTO tr_Releases (ArtistID, AlbumName, AlbumReleaseDate)
	VALUES
(1, 'A Night at the Opera', '1975-11-21'),
(2, 'Best O'' Boingo', '1991-09-17'),
(3, 'The Vice Quadrant: A Space Opera, Part 1', NULL),
(3, 'The Vice Quadrant: A Space Opera, Part 2', NULL);

INSERT INTO tr_Tracks (ReleaseID, SongName, SongLength)
	VALUES
-- Best O' Boingo tracks
(2, 'Dead Man''s Party', 382),
(2, 'When The Lights Go Out', 249),
(2, 'Gratitude', 313),
(2, 'Skin', 279),
(2, 'Flesh ''N Blood', 247),
(2, 'Not My Slave', 285),
(2, 'Stay', 216),
(2, 'Sweat', 269),
(2, 'No Spill Blood - Boingo Alive Version', 272),
(2, 'Out Of Control', 248),
(2, 'Weird Science', 365),
(2, 'No One Lives Forever', 246),
(2, 'Just Another Day', 312),
(2, 'Who Do You Want To Be', 199),
(2, 'Only A Lad', 229),
(2, 'Goodbye-Goodbye - Boingo Alive Version', 210),

-- A Night At The Opera tracks
(1, 'Death On Two Legs (Dedicated To...)', 224),
(1, 'Lazing On A Sunday Afternoon', 67),
(1, 'I''m In Love With My Car', 185),
(1, 'You''re My Best Friend', 171),
(1, '''39', 211),
(1, 'Sweet Lady', 243),
(1, 'Seaside Rendezvous', 134),
(1, 'The Prophet''s Song', 502),
(1, 'Love Of My Life', 217),
(1, 'Good Company', 204),
(1, 'Bohemian Rhapsody', 355),
(1, 'God Save The Queen', 73),

-- The Vice Quadrant: A Space Opera, Part 1 tracks
(3, 'The Vice Does Tight', 213),
(3, 'On a Crescendo', 259),
(3, 'SteamJunk', 204),
(3, 'Starburner', 200),
(3, 'Progress and Technology', 229),
(3, 'Wink the Satellite', 228),
(3, 'Burning in the Stratosphere', 144),
(3, 'Fire Fire', 228),
(3, 'Sky Sharks', 373),
(3, 'Daughter of Space', 247),
(3, 'Star Valley Night', 277),
(3, 'Commander Cosmo', 326),
(3, 'Where Is Everyone?', 177),
(3, 'Gg the Giraffe', 272),

-- The Vice Quadrant: A Space Opera, Part 2 tracks
(4, 'The Pulls', 217),
(4, 'Soliton', 293),
(4, 'Where I Left You', 188),
(4, 'Over the Moon', 236),
(4, 'It''s Cosmic', 230),
(4, 'Hold Me', 190),
(4, 'The Speed of Light', 277),
(4, 'Rav to the Rescue', 184),
(4, 'Starlight Star-Shine', 190),
(4, 'The Space Giant', 375),
(4, 'Oh No', 304),
(4, 'Necrostar', 319),
(4, 'Super Space Blaster Centi-Astroid Invaderpedes 2', 110),
(4, 'Whale', 290);