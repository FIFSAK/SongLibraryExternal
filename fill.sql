create table songs_external
(
    id           SERIAL PRIMARY KEY,
    group_name   TEXT NOT NULL,
    song_name    TEXT NOT NULL,
    release_date DATE NOT NULL,
    text         TEXT NOT NULL,
    link         TEXT NOT NULL
);

CREATE UNIQUE INDEX unique_song ON songs_external (group_name, song_name);

INSERT INTO songs_external (group_name, song_name, release_date, text, link)
VALUES ('Cosmic Drifters', 'Stellar Memories', '2018-03-12',
        'Walking through the cosmic fields of time\nStars become pathways to memories divine\nEchoes of laughter from worlds away\nGuiding my journey through night and day\nRemember the promises we made under twin moons\nWhen galaxies collided in celestial tunes',
        'https://example.com/cosmic_drifters_stellar'),

       ('Ocean''s Echo', 'Depths Untold', '2020-07-19',
        'Deep beneath the surface where sunlight fades to blue\nSecrets of the ancients wait, hidden from our view\nTides pull me closer to what I cannot see\nVoices of the deep call out, beckoning to me\nSalt and time have weathered stones that once stood tall and proud\nAncient cities sleeping now, by the waters shrouded',
        'https://example.com/oceans_echo_depths'),

       ('Mountain Whispers', 'Summit Dreams', '2019-05-22',
        'I''ve climbed these peaks a thousand times in dreams\nFelt the thin air burn my lungs, heard the eagle screams\nPersistence carves the path when strength begins to wane\nOne more step, one more breath, through sunshine, wind and rain\nThe view from here reveals what matters most\nSmall troubles fade away, no need to boast\nJust silence and perspective vast and wide\nThe journey and the summit, side by side',
        'https://example.com/mountain_whispers'),

       ('Urban Legends', 'Concrete Jungle', '2021-11-05',
        'Neon lights reflect in puddles on the street\nMidnight shadows dance to urban heartbeat\nStranger''s faces blur in crowds that never cease\nCacophony of lives in search of peace\nTall buildings reach for skies they cannot touch\nWhile down below we dream of just as much\nThis city breathes with stories yet untold\nOf struggles, love, and courage bold',
        'https://example.com/urban_legends_concrete'),

       ('Temporal Shift', 'Yesterday''s Tomorrow', '2022-01-30',
        'Minutes tick by like autumn leaves falling\nHours stretch into years, memories calling\nThe future we painted with hopeful hands\nNow faded into what time demands\nCircles and cycles, we return to the start\nWith wisdom inscribed on a weathered heart\nYesterday''s dreams transformed by today\nTomorrow''s horizon not so far away\nThe clock never stops its perpetual flight\nBut we choose how to spend every moment of light',
        'https://example.com/temporal_shift_yesterday'),

       ('Desert Nomads', 'Sandstone Stories', '2017-09-08',
        'Footprints vanish in the shifting sands\nAncient wisdom passed through weathered hands\nMirages shimmer in the distance wide\nPromising oasis where none reside\nThe sun beats down with unrelenting heat\nYet still we journey on with steady feet\nDusk brings relief and stars to guide the way\nTelling tales of travelers who couldn''t stay\nThe desert teaches patience, teaches truth\nSurvival requires more than just our youth',
        'https://example.com/desert_nomads_sandstone'),

       ('Midnight Ravens', 'Velvet Shadows', '2023-02-14',
        'Darkness wraps around me like a velvet cloak\nMidnight thoughts emerge with every word I spoke\nRavens call from branches twisted, gnarled and old\nGuardians of secrets that were never told\nThe moon observes in silence from her throne above\nWitnessing the dance between fear and love\nIn shadows we find parts we try to hide\nThe complexity of souls that dwell inside\nEmbracing both the darkness and the light\nFinding balance in the heart of night',
        'https://example.com/midnight_ravens_velvet'),

       ('Electric Dreams', 'Digital Horizons', '2022-10-17',
        'Pixels form the landscape of a world unseen\nData flows like rivers, code becomes the dream\nConnections forged across the digital divide\nIdentities both hidden and amplified\nWe search for meaning in the endless scroll\nSeeking to fill spaces in the soul\nHuman hearts still beating in a virtual age\nWriting our existence page by page\nThe line between real and imagined blurs\nAs evolution silently occurs',
        'https://example.com/electric_dreams_digital');


insert into songs_external (group_name, song_name, release_date, text, link)
values ('AAAAAAAAAAAAAAAAAAAAA',
        'BBBBBBBBBBBBBBBBBBBBBBB',
        '2017-09-08',
'Footprints vanish in the shifting sands

Ancient wisdom passed through weathered hands

Mirages shimmer in the distance wide

Promising oasis where none reside',
        'https://example.com/desert_nomads_sandstone');


select *
from songs_external;
