DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE Genre CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Directed CASCADE CONSTRAINTS;
DROP TABLE WorksFor CASCADE CONSTRAINTS;
DROP TABLE Writer CASCADE CONSTRAINTS;
DROP TABLE Wrote CASCADE CONSTRAINTS;
DROP TABLE Studio CASCADE CONSTRAINTS;
DROP TABLE Actors CASCADE CONSTRAINTS;
DROP TABLE ActedIn CASCADE CONSTRAINTS;
DROP TABLE ContractedWith CASCADE CONSTRAINTS;
DROP TABLE Reviews CASCADE CONSTRAINTS;

CREATE TABLE Movie(
mName		VARCHAR2 (20),
Runtime		NUMBER (3) CONSTRAINT Movie_runtime_nn NOT NULL,
ReleaseDate	DATE,
ProdStudio	VARCHAR2 (25),
CONSTRAINT 	movie_mName_pk PRIMARY KEY (mName));

CREATE TABLE Genre(
mName		VARCHAR2 (20),
gName		VARCHAR2 (20),
CONSTRAINT 	Genre_gname_pk PRIMARY KEY (mName,gName));

CREATE TABLE Director(
dName		VARCHAR2 (20),
dBirthday       DATE,
dBirthPlace	VARCHAR2 (30),
dBiography	VARCHAR2 (2000),
dLowRated	VARCHAR2 (30) CONSTRAINT director_dLowRated_nn NOT NULL,
dHighRated	VARCHAR2 (30) CONSTRAINT director_dHighRated_nn NOT NULL,
CONSTRAINT 	Director_dName_pk PRIMARY KEY (dName));

CREATE TABLE Directed(
dName		VARCHAR2 (20),
mName		VARCHAR2 (20),
CONSTRAINT 	Directed_pk PRIMARY KEY (dName, mName));

CREATE TABLE WorksFor(
dName		VARCHAR2 (20),
sName		VARCHAR2 (25),
CONSTRAINT 	WorksFor_pk PRIMARY KEY (dName, sName));

CREATE TABLE Writer(
wName		VARCHAR2 (20),
Birthday	DATE,
wBiography	VARCHAR2 (2000),
wBirthPlace	VARCHAR2 (30),
wLowRated	VARCHAR2 (30) CONSTRAINT writer_wlowrated_nn NOT NULL,
wHighRated	VARCHAR2 (30) CONSTRAINT writer_whighraited_nn NOT NULL,
CONSTRAINT 	writer_wname_pk PRIMARY KEY (wName));

CREATE TABLE Wrote(
wName		VARCHAR2 (20),
mName		VARCHAR2 (20),
CONSTRAINT 	wrote_pkey_pk PRIMARY KEY (wName, mName));

CREATE TABLE Studio(
sName		VARCHAR2 (25),
CONSTRAINT 	studio_sname_pk PRIMARY KEY (sName));

CREATE TABLE Actors (
aName		VARCHAR2 (30),
aBirthday	DATE,
Description 	VARCHAR2 (2000),
aLowRated	VARCHAR2 (30) CONSTRAINT actors_alowrated_nn NOT NULL,
aHighRated	VARCHAR2 (30) CONSTRAINT actors_ahighrated_nn NOT NULL,
CONSTRAINT 	actors_aname_pk PRIMARY KEY (aName));

CREATE TABLE ActedIn(
aName		VARCHAR2 (20),
mName		VARCHAR2 (20) ,
CONSTRAINT 	ActedIn_pKey_pk PRIMARY KEY (aName,mName));

CREATE TABLE ContractedWith(
aName		VARCHAR2 (20),
sName		VARCHAR2 (25),
CONSTRAINT 	contractedwith_pkey_pk PRIMARY KEY (aName, sName));

CREATE TABLE Reviews(
mName		VARCHAR2 (20) CONSTRAINT reviews_mName_nn NOT NULL,
Tomatometer	NUMBER (3) CONSTRAINT reviews_tomatometer_nn NOT NULL,
tAllCritics	NUMBER (3) CONSTRAINT reviews_tallcritics_nn NOT NULL,
tTopCritics	NUMBER (3) CONSTRAINT reviews_ttopcritics_nn NOT NULL,
tNumReviews	NUMBER (5) CONSTRAINT reviews_tnumreviews_nn NOT NULL,
tNumFresh	NUMBER (3) CONSTRAINT reviews_tnumfresh_nn NOT NULL,
tNumRotten	NUMBER (3) CONSTRAINT reviews_tnumrotten_nn NOT NULL,
audAvg		NUMBER (3) CONSTRAINT reviews_audavg_nn NOT NULL,
audVerified	NUMBER (3),
audAll		NUMBER (3), 
audNumReviews	NUMBER (7) CONSTRAINT reviews_audnumreviews_nn NOT NULL,
CONSTRAINT 	Reviews_movie_pk PRIMARY KEY (mName));

set escape on;
INSERT INTO Movie
VALUES('Black Panther',135,'16-feb-18','Marvel Studios');

INSERT INTO Genre
VALUES('Black Panther','Action \& Adventure');

INSERT INTO Director
VALUES ('Ryan Coogler', NULL,NULL,NULL, 'Black Panther','Creed II');

INSERT INTO Directed
VALUES ('Ryan Coogler', 'Black Panther');

INSERT INTO WorksFor 
VALUES ('Ryan Coogler', 'Marvel Studios');

INSERT INTO Writer
VALUES ('Ryan Coogler',NULL,NULL,NULL,'Creed II','Black Panther');

INSERT INTO Writer
VALUES ('Joe Robert Cole',NULL,NULL,NULL,'Black Panther','Black Panther');

INSERT INTO Wrote
VALUES ('Ryan Coogler','Black Panther');

INSERT INTO Wrote
VALUES ('Joe Robert Cole','Black Panther');

INSERT INTO Studio
VALUES ('Marvel Studios');

INSERT INTO Actors
VALUES ('Chadwick Bozeman',NULL,'Was an athlete as a child; involved with Little League baseball but primarily played basketball. Studied acting at the British American Drama Academy in Oxford after graduating from Howard University in Washington, United States. Originally aspired to be a director. Made his TV debut in a 2003 episode of Third Watch. Trained for five months with baseball coaches to prepare for his role as Jackie Robinson in 42 \(2013\).','Gods of Egypt','Black Panther');

INSERT INTO ActedIn
VALUES ('Chadwick Bozeman','Black Panther');

INSERT INTO ContractedWith
VALUES ('Chadwick Bozeman','Marvel Studios');

INSERT INTO Reviews
VALUES ('Black Panther',097,097,100,00495,478,017,079,NULL,NULL,88211);

INSERT INTO Movie
VALUES ('Avengers: Endgame',182,'26-apr-19','Marvel Studios');

INSERT INTO Genre
VALUES('Avengers\: Endgame','Action \& Adventure');

INSERT INTO Director
VALUES ('Joe Russo', NULL,NULL,'As one half of the brotherly directing team that also includes his sibling Anthony, Joe Russo was in large part responsible for the success of the critically acclaimed but criminally short-lived Fox television sitcom Arrested Development. Born a year apart in an Italian neighborhood of Cleveland, OH, the sons of a prominent liberal politician first learned the value of hard work when the political turmoil of the 1970s found their hometown the first American city to go bankrupt since the Great Depression. Subsequently determined to make a name for themselves in the world of cinema, Anthony and Joe got a head start on film-school education by using credit cards and student loans to finance Pieces, a black comedy concerning the hair-replacement industry that served as a crash course into the world of filmmaking for the pair. They shot the film in and around their hometown with the help of numerous friends and family members, and their gamble paid off tenfold when it screened at both the Slamdance and American Film Institute festivals in 1997, also earning Joe a Best Actor award at the later.', 'A Merry Friggin'' Christmas','Avengers\: Endgame');

INSERT INTO Director
VALUES ('Anthony Russo', NULL,NULL,'Financed his first independent film Pieces which he wrote directed and produced with his brother with student loans and credit cards. While still in debt from Pieces went to UCLA to pursue a degree in Film. Paid the credit card debt accumulated from making Pieces a decade later it cost $30000 to make the movie. After seeing Pieces director Steven Soderbergh decided to produce the brothers next film Welcome to Collinwood 2002. Directs most of his work along with his brother Joseph Russo and they are known together as the Russo brothers. Known for directing multiple films from the Marvel Cinematic Universe including Captain America: The Winter Soldier 2014 and Avengers: Infinity War 2018.', 'A Merry Friggin Christmas','Most Dangerous Man in Ame');

INSERT INTO Directed
VALUES ('Joe Russo', 'Avengers\: Endgame');

INSERT INTO Directed
VALUES ('Anthony Russo', 'Avengers\: Endgame');

INSERT INTO WorksFor 
VALUES ('Joe Russo', 'Marvel Studios');

INSERT INTO Writer
VALUES ('Christopher Markus',NULL,NULL,NULL,'Pain \& Gain','Avengers\: Endgame');

INSERT INTO Writer
VALUES ('Stephen McFeely',NULL,NULL,NULL,'Pain \& Gain','Avengers\: Endgame');

INSERT INTO Wrote
VALUES ('Christopher Markus','Avengers\: Endgame');

INSERT INTO Wrote
VALUES ('Stephen McFeely','Avengers\: Endgame');

INSERT INTO Actors (aName,aBirthday,Description,aLowRated,aHighRated)
VALUES ('Robert Downey Jr','04-apr-65','Hailed by many critics as one of the most brilliant and versatile actors of his generation Robert Downey Jr chalked up a formidable onscreen track record that quickly launched the young thesp into the stratosphere. Although for a time Downeys stormy offscreen life and personal problems threatened to challenge his public image he quickly bounced back and overcame these setbacks with a continued array of impressive roles on the big and small screens that never sacrificed his audience appeal or affability.The son of underground filmmaker Robert Downey Downey Jr was born in New York City on April 4 1965. He made his first onscreen appearance at the age of five as a puppy in his fathers film Pound 1970.','Johnny Be Good','Shortcuts');

INSERT INTO ActedIn
VALUES ('Robert Downey Jr','Avengers\: Endgame');

INSERT INTO ActedIn
VALUES ('Chadwick Bozeman','Avengers\: Endgame');

INSERT INTO ContractedWith
VALUES ('Robert Downey Jr','Marvel Studios');

INSERT INTO Reviews (mName,Tomatometer,tAllCritics,tTopCritics,tNumReviews,tNumFresh,tNumRotten,audAvg,audVerified,audAll,audNumReviews)
VALUES ('Avengers\: Endgame',094,094,093,00505,473,032,090,NULL,NULL,69079);

INSERT INTO Movie
VALUES('Us',120,'22-mar-19','Universal Pictures');

INSERT INTO Genre
VALUES('Us','Horror');

INSERT INTO Director (dName,dBirthday,dBirthPlace,dBiography,dLowRated,dHighRated)
VALUES ('Jordan Peele','21-feb-79',NULL,'Intended to be a puppeteer in college but dropped out to study comedy including a stint with Boom Chicago in Amsterdam while on a cast swap with Second City in Chicago in 2002 met his future comedic partner Keegan-Michael Key. Before The premiere of Key and Peele on Comedy Central in 2012overlapped with Keyfor several seasons in the cast ofMADtv. Unsuccessfully auditioned to play Barack Obama on Saturday Night Live in 2008 the role went to Fred Armisen but would earn acclaim for impersonating the president on Key and Peele In 2012. Was flattered to learn thatObama was a fan of his impression-and of Keys portrayal ofLuther the presidentsanger translator-and in the spring of 2012 they had the opportunity to meet him in Los Angeles. Like Key has a black father and a white mother a biracial status that provides a unique cultural sensitivity and informs much of their comedy.', 'Little Fockers','Horror Noir');

INSERT INTO Directed
VALUES ('Jordan Peele', 'Us');

INSERT INTO WorksFor 
VALUES ('Jordan Peele', 'Universal Pictures');

INSERT INTO Writer (wName,Birthday,wBiography,wBirthPlace,wLowRated,wHighRated)
VALUES ('Jordan Peele','21-feb-79','Intended to be a puppeteer in college but dropped out to study comedy including a stint with Boom Chicago in Amsterdam while on a cast swap with Second City in Chicago in 2002 met his future comedic partner Keegan-Michael Key. Before The premiere of Key and Peele on Comedy Central in 2012overlapped with Keyfor several seasons in the cast ofMADtv. Unsuccessfully auditioned to play Barack Obama on Saturday Night Live in 2008 the role went to Fred Armisen but would earn acclaim for impersonating the president on Key and Peele In 2012. Was flattered to learn thatObama was a fan of his impression-and of Keys portrayal ofLuther the presidentsanger translator-and in the spring of 2012 they had the opportunity to meet him in Los Angeles. Like Key has a black father and a white mother a biracial status that provides a unique cultural sensitivity and informs much of their comedy.',NULL, 'Little Fockers','Horror Noir');

INSERT INTO Wrote
VALUES ('Jordan Peele','Us');

INSERT INTO Studio
VALUES ('Universal Pictures');

INSERT INTO Actors
VALUES ('Lupita Nyongo',NULL,'Although Lupita Nyongo might seem like an overnight success story at first glance -- she won an Oscar for Best Supporting Actress for her feature-film debut 12 Years a Slave -- her meteoritic rise is really the product of an artsy globe-hopping upbringing and a tremendous amount of hard work.The second of six children Nyongo was born on March 1 1983 in Mexico City to Kenyan parents Peter Anyang and Dorothy. Her father was a visiting lecturer in political science at the Colegio de México at the time and according to the Kenyan custom of naming children after current events her parents chose the Spanish name Lupita a shortened version of Guadalupe.The family returned to Kenya the following year and Nyongo grew up in a middle-class community in Nairobi. She got the acting bug early on appearing in school plays and making her professional debut at 14 as Juliet in a performance of Romeo and Juliet by the Phoenix Players a Nairobi-based repertory company.At 16 her parents sent her back to Mexico where she learned Spanish while studying at Universidad Nacional Autónoma de Méxicos Learning Center for Foreigners in fact shes fluent in four languages total: English Spanish Luo and Swahili. She went to the United States for her undergraduate education earning a degree in film and African studies at Hampshire College in Amherst MA.','Star Wars: TROS','Black Panther');

INSERT INTO ActedIn
VALUES ('Lupita Nyongo','Us');

INSERT INTO ActedIn
VALUES ('Lupita Nyongo','Black Panther');

INSERT INTO ContractedWith
VALUES ('Lupita Nyongo','Universal Pictures');

INSERT INTO ContractedWith
VALUES ('Lupita Nyongo','Marvel Studios');

INSERT INTO Reviews
VALUES ('Us',93,93,92,00515,480,35,59,NULL,NULL,12488);

INSERT INTO Movie
VALUES('Toy Story 4',090,'21-jun-19','Disney/Pixar');

INSERT INTO Genre
VALUES('Toy Story 4','Animation');

INSERT INTO Genre
VALUES('Toy Story 4','Kids \& Family');

INSERT INTO Director
VALUES ('Josh Cooley', NULL,NULL,NULL, 'Toy Story 4','Inside Out');

INSERT INTO Directed
VALUES ('Josh Cooley', 'Toy Story 4');

INSERT INTO WorksFor 
VALUES ('Josh Cooley', 'Disney/Pixar');

INSERT INTO Writer (wName,Birthday,wBiography,wBirthPlace,wLowRated,wHighRated)
VALUES ('Andrew Stanton','03-dec-65','Andrew Stanton is one of the main driving forces behind computer animation powerhouse Pixar Studios and his contributions to such modern animated classics as Toy Story and Finding Nemo are second only to that of studio founder John Lasseter. From director Finding Nemo to producer Monsters Inc. to story artist Toy Story and A Bugs Life and frequent voice actor his voice can be heard in some capacity in near every Pixar production Stanton has had a hand in virtually every aspect of production. His family-friendly sensibilities and keen writing skills have resulted in films that can truly be appreciated by young and old alike -- a true rarity in the realm of so-called family entertainment.A native of Rockport MA Stanton received his BFA in character animation from the California Institute of the Arts before working as an animator for Kroyer Films in the 1980s. As the decade drew to a close Stanton also worked as a writer for animation legend Ralph Bakshis Mighty Mouse the New Adventures. In 1990 the talented writeranimator became the second animator to join Lasseters fledgling Pixar Studios.',NULL,'John Carter','Toy Story 2');

INSERT INTO Wrote
VALUES ('Andrew Stanton','Toy Story 4');

INSERT INTO Studio
VALUES ('Disney\/Pixar');

INSERT INTO Actors
VALUES ('Tom Hanks','09-jul-56','American leading actor Tom Hanks has become one of the most popular stars in contemporary American cinema. Born July 9 1956 in Concord CA Hanks spent much of his childhood moving about with his father an itinerant cook and continually attempting to cope with constantly changing schools religions and stepmothers. After settling in Oakland CA he began performing in high-school plays. He continued acting while attending Cal State Sacramento and left to pursue his vocation full-time. In 1978 Hanks went to find work in New York while there he married actressproducer Samantha Lewes whom he later divorced.Hanks debuted onscreen in the low-budget slasher movie He Knows Youre Alone 1979. Shortly afterward he moved to Los Angeles and landed a co-starring role in the TV sitcom Bosom Buddies he also worked occasionally in other TV series such as Taxi and Family Ties as well as in the TV movie Mazes and Monsters. Hanks finally became prominent when he starred opposite Daryl Hannah in the Disney comedy Splash which became the sleeper hit of 1984. Audiences were drawn to the lanky curly headed actors amiable laid-back style and keen sense of comic timing. He went on to appear in a string of mostly unsuccessful comedies before starring in Big 1988 in which he gave a delightful performance as a child in a grown mans body.','My Life in Ruins','Notes From The Field');

INSERT INTO ActedIn
VALUES ('Tom Hanks','Toy Story 4');

INSERT INTO ContractedWith
VALUES ('Tom Hanks','Disney/Pixar');

INSERT INTO Reviews
VALUES ('Toy Story 4',097,097,098,00429,417,012,094,094,092,53145);

INSERT INTO Movie
VALUES('The Wizard of Oz',101,'25-aug-39','Warner Bros Pictures');

INSERT INTO Genre
VALUES('The Wizard of Oz','Kids \& Family');

INSERT INTO Director
VALUES ('King Vidor', '08-feb-1894','Galveston, TX','Born in Galveston, TX, King Vidor was the son of a wealthy lumber manufacturer. He became interested in movies -- then a brand new form of entertainment -- as a young boy, and later took a job as a ticket-taker at the local theater, where he subsequently became a fill-in projectionist. Vidor took this opportunity to watch the same movies over and over, learning from what he saw and deciding that he could do as good a job as most of the people whose films were up on the screen. After working as an amateur photographer, he began shooting newsreel material of events in his area of Texas and selling it to newsreel producers. It was after his marriage to the former Florence Arto in 1915 that he decided to head out to the then newly formed film colony in Hollywood. The couple entered the motion-picture business, but Florence Vidor was the far more successful of the two at first, starting out as a bit player and moving up to supporting roles in films such as A Tale of Two Cities \(1917\) and into starring roles in the late teens and 1920s. King Vidor, by contrast, worked as an extra and clerk while writing scripts in his spare time, which he was mostly unsuccessful at selling.', 'Solomon and Sheba','Northwest Passage');

INSERT INTO Director
VALUES ('Victor Fleming', '23-feb-1889','La Canada, CA','An assistant cameraman for director Allan Dwan in the early teens Victor Fleming was a director of photography by 1915 and worked under D.W. Griffiths supervision as well as for Dwan on several films with Douglas Fairbanks. Fairbanks also starred in Flemings first two films as a director: 1919s When the Clouds Roll By co-directed by Theodore Reed and his solo effort of the following year The Mollycoddle. Fleming helmed several rugged actioners in the 1920s and became a reliable craftsman of impersonal but handsome films at MGM in the 1930s. Skilled at films for young audiences--Treasure Island Captains Courageous The Wizard of Oz--Fleming was also a favorite director of actor Clark Gable and having guided him in Red Dust 1932 and Test Pilot 1938 was brought in to take over the direction of Gone with the Wind 1939. His most notable films of the 40s were the Spencer Tracy films Dr. Jekyll and Mr. Hyde 1941 Tortilla Flat 1942 and A Guy Named Joe 1944 and his final film Joan of Arc 1948 starring Ingrid Bergman. Dr. Jekyll and Mr. Hyde','Dr Jekyll and Mr. Hyde','Treasure Island');

INSERT INTO Directed
VALUES ('King Vidor', 'The Wizard of Oz');

INSERT INTO Directed
VALUES ('Victor Fleming', 'The Wizard of Oz');

INSERT INTO WorksFor 
VALUES ('King Vidor', 'Warner Bros Pictures');

INSERT INTO WorksFor
VALUES ('Victor Fleming', 'Warner Bros Pictures');

INSERT INTO Writer
VALUES ('Noel Langley','25-dec-11','A successful Broadway playwright Langley began writing for films in the late 30s most notably on the musicals Maytime and The Wizard of Oz. After World War Two he entered the British film industry working on such memorable films as Trio Scrooge aka A Christmas Carol Tom Browns Schooldays and Richard Thorpes swashbucklers Ivanhoe and The Prisoner of Zenda. Langley began directing his own scripts in 1952 with his Dickens adaptation The Pickwick Papers he went on to helm the sex farce Our Girl Friday aka The Adventures of Sadie Svengali with Donald Wolfit and the fact-based occult drama The Search for Bridey Murphy. His later scriptwriting credits include The Vagabond King for director Michael Curtiz and Snow White and the Three Stooges.',NULL,'Knights o.t. Round Table','Maytime');

INSERT INTO Writer
VALUES ('Edgar Allen Woolf',NULL,'Before entering films Edgar Allan Woolf was a prolific vaudeville sketch writer at one time 60 of his sketches were playing simultaneously on the vaudeville circuits. Woolf also penned special material for Broadway musical revues not to mention a few plays one of which April Fool was filmed in 1926. When talkies came in he was signed by MGM as a scenarist Freaks Mask of Fu Manchu and script doctor. He usually worked in tandem with Florence Ryerson their best-known collaboration was the 1939 classic The Wizard of Oz. In addition to his scripting talents Woolf was an accomplished gourmet chef and for many years his weekend dinner parties were major Hollywood social events. At the time of his death in 1943 Edgar Allan Woolf hadnt received a screen credit for nearly five years though hed kept active rewriting the works of others sans billing.',NULL,'Ziegfield Follies','The Wizard of Oz');

INSERT INTO Wrote
VALUES ('Noel Langley','The Wizard of Oz');

INSERT INTO Wrote
VALUES ('Edgar Allen Woolf', 'The Wizard of Oz');

INSERT INTO Studio
VALUES ('Warner Bros Pictures');

INSERT INTO Actors
VALUES ('Judy Garland','10-jun-22','Entertainer Judy Garland was both one of the greatest and one of the most tragic figures in American show business. The daughter of a pushy stage mother Garland and her sisters were forced into a vaudeville act called the Gumm Sisters her real name which appeared in movie shorts and at the 1933 Chicago Worlds Fair. It was clear from the outset that Judy was the star of the act and as such was signed by MGM as a solo performer in 1936. The studio adored Garlands adult-sounding singing but was concerned about her puffy facial features and her curvature of the spine. MGM decided to test both Garland and another teenage contractee Deanna Durbin in a musical swing vs. the classics short subject entitled Every Sunday 1936.','Words and Music','Sid \& Judy');

INSERT INTO ActedIn
VALUES ('Judy Garland','The Wizard of Oz');

INSERT INTO ContractedWith
VALUES ('Judy Garland','Warner Bros Pictures');

INSERT INTO Reviews
VALUES ('The Wizard of Oz',098,098,094,00116,114,002,089,NULL,NULL,876161);

INSERT INTO Movie
VALUES('Fatal Attraction',120, '11-Sep-1987', 'Paramount');

INSERT INTO Director
VALUES('Adrian Lyne', '04-Mar-1941', NULL, 'British born director Adrian Lyne grew up professionally in TV commercials carrying over the quick-cut hard-sell techniques of that specialized genre into his first film Foxes 1980. Lyne went on to embrace the burgeoning MTV directorial school for his breakthrough feature Flashdance 1983. His next project 9 1/2 Weeks 1986 represented Lynes first creative battle with the editing room. The director had one notion of what constituted too much in this erotic drama the editors backed by the producers had another -- and the result was two separate release versions one rated R the other not rated at all. In Fatal Attraction 1987 his biggest box-office hit Lyne favored the scripts original ironic-twist ending but preview audiences demanded that leading lady Glenn Close be punished for her psychotic behavior.As with 9 1/2 Weeks Fatal Attraction ultimately went out in two versions: theatergoers saw the heavily revised ending filmed a full year after principal photography ended while videocassette and laserdisc connoisseurs were treated to the directors cut. Jacobs Ladder 1990 still stands as the most complexly structured of Lynes films. Alas it failed to register at the box office while Lynes subsequent film the spell-it-all-out Indecent Proposal 1993 made money by the basketful -- indicating perhaps that whatever the future holds for Adrian Lyne his choice of film subjects and manner of treatment will be governed less by his personal vision than by popular taste.By this time no stranger to controversy Lynes 1997 interpretation of Lolita raised much public uproar with its intimate scenes between the then 15-year-old Dominique Swain and the considerably older Jeremy Irons though a body double was used for the more questionable scenes.', 'Indecent Proposal', 'Fatal Attraction');

INSERT INTO Directed
VALUES('Adrian Lyne', 'Fatal Attraction');

INSERT INTO WorksFor
VALUES('Adrian Lyne', 'Paramount');

INSERT INTO Writer
VALUES('James Dearden', '14-Sep-1949', 'Screenwriter James Dearden got his first big break with his script for the 1987 blockbuster Fatal Attraction. The following year he made his directorial debut with the spy thriller Pascalis Island.', NULL, 'SurvivingChristmasw.t.Relative', 'Fatal Attraction');

INSERT INTO Wrote
VALUES('James Dearden', 'Fatal Attraction');

INSERT INTO Studio
VALUES('Paramount');

INSERT INTO Actors
VALUES('Michael Douglas', '25-Sep-1944', 'Major star and producer and member of one of Hollywoods most prominent families to boot Michael Douglas was born to movie icon Kirk Douglas and British actress Diana Dill on September 25 1944 in New Brunswick NJ. From the age of eight he was raised in Connecticut by his mother and a stepfather but spent time with his father during vacations from military school. It was while on location with his father that the young Douglas began learning about filmmaking. In 1962 he worked as an assistant director on Lonely Are the Brave and was so taken with the cinema that he passed up the opportunity to study at Yale for that of studying drama at the University of California at Santa Barbara.', 'BeyondReasonableDoubt', 'One Day In September');

INSERT INTO ActedIn
VALUES('Michael Douglas', 'Fatal Attraction');

INSERT INTO ContractedWith
VALUES('Michael Douglas', 'Paramount');

INSERT INTO Reviews
VALUES('Fatal Attraction', 75, 6.8, 56, 52, 39, 13, 72, 72, 72, 52988);

INSERT INTO Movie
VALUES('12 Monkeys', 131, '26-Jan-1995', 'Atlas Entertainment');

INSERT INTO Director
VALUES('Terry Gilliam', '22-Nov-1940', 'Minneapolis', 'For most of Terry Gilliams early career fans of the popular comedy show Monty Pythons Flying Circus assumed that he was British since Pythons other five members were natives of Britain. But the innovative animator and future director who spent more time behind the scenes than in front of the camera was actually the troupes only American member. Born in Minneapolis Minnesota on November 22 1940 Gilliam was briefly employed as an assistant editor for Help! magazine a job that introduced him to English comedian John Cleese who was in NYC posing for a comic photo-strip in the magazine; he then emigrated to England in 1967.', 'Absolutely Anything', 'An Accidental Studio');

INSERT INTO Directed
VALUES('Terry Gilliam', '12 Monkeys');

INSERT INTO WorksFor
VALUES('Terry Gilliam', 'Atlas Entertainment');

INSERT INTO Writer
VALUES('Janet Peoples', NULL, NULL,NULL, '12 Monkeys', '12 Monkeys');

INSERT INTO Wrote
VALUES('Janet Peoples', '12 Monkeys');

INSERT INTO Studio
VALUES('Atlas Entertainment');

INSERT INTO Actors
VALUES('Bruce Willis', '19-Mar-1955', 'Born Walter Willis an Army brat to parents stationed in Idar Oberstein West Germany on March 19 1955 Bruce Willis grew up in New Jersey from the age of two. As a youngster he developed a stutter that posed the threat of social alienation but he discovered an odd quirk: while performing in front of large numbers of people the handicap inexplicably vanished. This led Willis into a certified niche as a comedian and budding actor.', '10 Minutes Gone', 'Looper');

INSERT INTO Actors
VALUES('Brad Pitt', '18-Dec-1963', 'The son of a trucking company manager Brad Pitt was born December 18 1963 in Shawnee OK. Raised in Missouri as the oldest of three children and brought up in a strict Baptist household Pitt enrolled at the University of Missouri following high school graduation studying journalism and advertising. However after discovering his love of acting he dropped out of college two credit hours before he could graduate and moved to Hollywood. Once in California Pitt took acting classes and supported himself with a variety of odd jobs that included chauffeuring strippers to private parties waiting tables and wearing a giant chicken suit for a local restaurant chain.', 'Cool World', 'Big Men');

INSERT INTO ActedIn
VALUES('Bruce Willis', '12 Monkeys');

INSERT INTO ActedIn
VALUES('Brad Pitt', '12 Monkeys');

INSERT INTO ContractedWith
VALUES('Bruce Willis', 'Atlas Entertainment');

INSERT INTO ContractedWith
VALUES('Brad Pitt', 'Atlas Entertainment');

INSERT INTO Reviews
VALUES('12 Monkeys', 90, 67, 22, 67, 60, 7, 88, 88, 88, 390957);

INSERT INTO Movie
VALUES('Se7en', 125, '22-Sep-1995', 'New Line Cinema');

INSERT INTO Director
VALUES('David Fincher', '28-Aug-1962', 'Denver, Colorado', 'With only a handful of credits tucked under his belt wunderkind prodigy David Fincher became one of the most celebrated artists to scale the heights of Tinseltown during the late 90s and early 2000s. Although Fincher met with some derision early on as the director of the critically excoriated Alien 3 in 1992 his work on Seven three years down the road won him critical approval and unanimous acceptance across the industry and marked only the beginning of an influential splashy career.', 'Love and Other Disasters', 'Hitchcock/Truffaut');

INSERT INTO Directed
VALUES('David Fincher', 'Se7en');

INSERT INTO WorksFor
VALUES('David Fincher', 'New Line Cinema');

INSERT INTO Writer
VALUES('Andrew Kevin Walker', NULL, 'Even if you dont know who Andrew Kevin Walker is you may know what he looks like. Walker appeared as the first dead body in Seven 1995 and played the sleeping neighbor who Jodie Foster and Kristen Stewart signal for help in Panic Room 2002. You may also have seen his name. He lent it to the three detectives -- Andrew Kevin and Walker -- who try to castrate Edward Norton in Fight Club 1999. Walkers true claim to fame is as one of Hollywoods leading screenwriters and script doctors. He specializes in big-budget thrillers that are just as gutsy as their artsy counterparts he has also gotten the first crack at the industrys most anticipated screenplays as well as put the final touches on todays most popular films.', NULL, 'Hideaway', 'Se7en');

INSERT INTO Wrote
VALUES('Andrew Kevin Walker', 'Se7en');

INSERT INTO Studio
VALUES('New Line Cinema');

INSERT INTO Actors
VALUES('Morgan Freeman', '01-Jun-1937', 'Morgan Freeman has enjoyed an impressive and varied career on stage television and screen. It is a career that began in the mid60s when Freeman appeared in an offBroadway production of The Niggerlovers and with Pearl Bailey in an allAfricanAmerican Broadway production of Hello Dolly! in 1968. He went on to have a successful career both on and offBroadway showcasing his talents in everything from musicals to contemporary drama to Shakespeare. Before studying acting the Memphisborn Freeman attended Los Angeles Community College and served a fiveyear stint with the Air Force from 1955 to 1959.', 'The Poison Rose', 'March of the Penguins 2');

INSERT INTO ActedIn
VALUES('Morgan Freeman', 'Se7en');

INSERT INTO ActedIn
VALUES('Brad Pitt', 'Se7en');

INSERT INTO ContractedWith
VALUES('Morgan Freeman', 'New Line Cinema');

INSERT INTO Reviews
VALUES('Se7en', 81, 81, 63, 74, 60, 14, 95, 95, 95, 468180);

INSERT INTO Movie
VALUES('Rosemarys Baby', 136, '12-Jun-1968', 'Paramount Pictures');

INSERT INTO Director
VALUES('Roman Polanski', '18-Aug-1933', 'Paris, France', 'Thanks to his darkly unique perspective and grim often nihilistic approach to storytelling director Roman Polanski has left an indelible mark on world cinema. Although his films have been compared to those of Alfred Hitchcock with their use of gallows humor tension and occasional surrealism to tell amoral stories of ordinary men struggling to cope in a hostile ironic world Polanski unlike Hitchcock has chosen to experiment with a variety of genres. In this regard the director has considered himself a cinematic playboy intent on exploring the possibilities of all film categories. A uniformly pessimistic viewpoint provides the clearest link to entries in Polanskis body of work something that is widely traced back to years of childhood trauma.', 'Rush Hour 3', 'Spine Tingler');

INSERT INTO Directed
VALUES('Roman Polanski', 'Rosemarys Baby');

INSERT INTO WorksFor
VALUES('Roman Polanski', 'Paramount Pictures');

INSERT INTO Writer
VALUES('Roman Polanski', '18-Aug-1933','Thanks to his darkly unique perspective and grim often nihilistic approach to storytelling director Roman Polanski has left an indelible mark on world cinema. Although his films have been compared to those of Alfred Hitchcock with their use of gallows humor tension and occasional surrealism to tell amoral stories of ordinary men struggling to cope in a hostile ironic world Polanski unlike Hitchcock has chosen to experiment with a variety of genres. In this regard the director has considered himself a cinematic playboy intent on exploring the possibilities of all film categories. A uniformly pessimistic viewpoint provides the clearest link to entries in Polanskis body of work something that is widely traced back to years of childhood trauma.','Paris, France', 'Rush Hour 3', 'Spine Tingler');

INSERT INTO Wrote
VALUES('Roman Polanski', 'Rosemarys Baby');

INSERT INTO Studio
VALUES('Paramount Pictures');

INSERT INTO Actors
VALUES('Mia Farrow', '09-Feb-1945', 'American actress and longtime Woody Allen muse Mia Farrow was the third of seven children born to film star Maureen OSullivan and director John Farrow. Born February 9 1945 she enjoyed the usual pampered Hollywood kid lifestyle until she fell victim to polio at the age of nine; her struggle to recover from this illness was the first of many instances in which the seemingly frail Farrow exhibited a will of iron. Educated in an English convent school Farrow returned to California with plans to take up acting. With precious little prior experience that included a bit part in her fathers 1959 film John Paul Jones she debuted on Broadway in a 1963 revival of The Importance of Being Earnest.', 'Arthur and the Great Adventure', 'Spine Tingler');

INSERT INTO ActedIn
VALUES('Mia Farrow', 'Rosemarys Baby');

INSERT INTO ContractedWith
VALUES('Mia Farrow', 'Paramount Pictures');

INSERT INTO Reviews
VALUES('Rosemarys Baby', 96, 96, 88, 17, 15, 2, 87, 87, 87, 73715);

INSERT INTO Movie
VALUES('Pulp Fiction', 153, '14-Oct-1944', 'Miramax Films');

INSERT INTO Director
VALUES('Quentin Tarantino', '27-Mar-1963', 'Knoxville, Tennessee', 'Born March 27th 1963 director/screenwriter/actor/producer Quentin Tarantino was perhaps the most distinctive and volatile talent to emerge in American film in the early 90s. Unlike the previous generation of American filmmakers Tarantino learned his craft from his days as a video clerk rather than as a filmschool student. Consequently he developed an audacious fusion of pop culture and independent arthouse cinema; his films were thrillers that were distinguished as much by their clever twisting dialogue as their outbursts of extreme violence.', 'Daltry Calhoun', 'Z Channel');

INSERT INTO Directed
VALUES('Quentin Tarantino', 'Pulp Fiction');

INSERT INTO WorksFor
VALUES('Quentin Tarantino', 'Miramax Films');

INSERT INTO Writer
VALUES('Quentin Tarantino', '27-Mar-1963', 'Born March 27th 1963 director/screenwriter/actor/producer Quentin Tarantino was perhaps the most distinctive and volatile talent to emerge in American film in the early 90s. Unlike the previous generation of American filmmakers Tarantino learned his craft from his days as a video clerk rather than as a filmschool student. Consequently he developed an audacious fusion of pop culture and independent arthouse cinema; his films were thrillers that were distinguished as much by their clever twisting dialogue as their outbursts of extreme violence.', 'Knoxville, Tennessee', 'Daltry Calhoun', 'Z Channel');

INSERT INTO Wrote
VALUES('Quentin Tarantino', 'Pulp Fiction');

INSERT INTO Studio
VALUES('Miramax Films');

INSERT INTO Actors
VALUES('John Travolta', '18-Feb-1954', 'Born February 18 1954 in Englewood John Travolta was the youngest of six children in a family of entertainers all but one of his siblings pursued showbusiness careers as well. By the age of 12 Travolta himself had already joined an area actors group and soon began appearing in local musicals and dinnertheater performances. By age 16 he dropped out of high school to take up acting fulltime relocating to Manhattan to make his offBroadway debut in 1972 in Rain and a minor role in the touring company of the hit musical Grease followed.', 'The Poison Rose', 'Paul Williams Still Alive');

INSERT INTO ActedIn
VALUES('John Travolta', 'Pulp Fiction');

INSERT INTO ContractedWith
VALUES('John Travolta', 'Miramax Films');

INSERT INTO Reviews
VALUES('Pulp Fiction', 91, 91, 88, 32, 95, 9, 96, 96, 96, 1127331);

INSERT INTO Movie 
VALUES('Mulan', 88, '19-Jun-1998', 'Buena Vista');

INSERT INTO Director
VALUES('Barry Cook', NULL, NULL, NULL, 'Walking With Dinosaurs', 'Arthur Christmas');

INSERT INTO Directed
VALUES('Barry Cook', 'Mulan');

INSERT INTO WorksFor
VALUES('Barry Cook', 'Buena Vista');

INSERT INTO Writer
VALUES('Rita Hsiao', NULL, NULL, NULL, 'My Little Pony:The Movie', 'Toy Story 2');

INSERT INTO Wrote
VALUES('Rita Hsiao', 'Mulan');

INSERT INTO Studio
VALUES('Buena Vista');

INSERT INTO Actors
VALUES('Ming-Na Wen', NULL, 'An actress who can play period drama as convincingly as contemporary comedy MingNa Wen was born in Macau China on November 20 1963. When she was four MingNa and her family pulled up stakes and moved to the United States first settling in New York City and five years later relocating to Pittsburgh PA where her parents opened a restaurant the Chinatown Inn which they still operate today. In the third grade MingNa played a bunny rabbit in a school play and she was fascinated with the theater from that moment on after graduating from high school MingNa enrolled in CarnegieMellon University where she graduated with honors and received a degree in theater.', 'Mulan II', 'Marvel Rising: Secret Warriors');

INSERT INTO ActedIn
VALUES('Ming-Na Wen', 'Mulan');

INSERT INTO ContractedWith
VALUES('Ming-Na Wen', 'Buena Vista');

INSERT INTO Reviews
VALUES('Mulan', 86, 86, 75, 77, 66, 11, 85, 85, 85, 611509);

INSERT INTO Movie
VALUES('The Blind Side', 128, '20-Nov-2009', 'Warner Bros Pictures');

INSERT INTO Director
VALUES('John Lee Hancock', '15-Dec-1956', NULL, NULL, 'The Alamo', 'The Rookie');

INSERT INTO Directed
VALUES('John Lee Hancock', 'The Blind Side');

INSERT INTO WorksFor
VALUES('John Lee Hancock', 'Warner Bros Pictures');

INSERT INTO Writer
VALUES('John Lee Hancock', '15-Dec-1956', NULL,NULL, 'The Alamo', 'The Rookie');

INSERT INTO Wrote
VALUES('John Lee Hancock', 'The Blind Side');

INSERT INTO Actors
VALUES('Sandra Bullock', '26-Jul-1964', 'Giving new meaning to the term Americas Sweetheart Sandra Bullock won over scores of filmgoers and critics with her wholesome exuberant portrayals of ordinary women in extraordinary circumstances. Since her breakthrough role as Speeds unwitting heroine Bullock has enjoyed the type of popularity that was in the past reserved for actresses along the lines of Mary Pickford or Shirley Temple.', 'Speed 2-Cruise Control', 'Gravity');

INSERT INTO ActedIn
VALUES('Sandra Bullock', 'The Blind Side');

INSERT INTO ContractedWith
VALUES('Sandra Bullock', 'Warner Bros Pictures');

INSERT INTO Reviews
VALUES('The Blind Side', 66, 66, 44, 201, 132, 69, 85, 85, 85, 431747);

INSERT INTO Movie
VALUES('Paranormal Activity', 86, '16-Oct-2009', 'Paramount Pictures');

INSERT INTO Director
VALUES('Oren Peli', NULL, NULL, 'Oren Peli moved to the United States from Israel when he was 19. An intensive studier of animation and graphic design he worked on video games to pay the bills but really wanted to direct and edit feature films so he made it happen. In 2009 he took some inspiration from The Blair Witch Project and made his own firstpersonstyle horror movie Paranormal Activity. The budget was only about $15000 but Peli used his skills as a filmmaker and editor to create terrifying suspense so much so that audiences who caught the movie during its initial limited release created a massive buzz full of stories about theaters full of screaming patrons.', 'Paranormal Activity:Ghost Dim.', 'Paranormal Activity');

INSERT INTO Directed
VALUES('Oren Peli', 'Paranormal Activity');

INSERT INTO WorksFor
VALUES('Oren Peli', 'Paramount Pictures');

INSERT INTO Writer
VALUES('Oren Peli', NULL, 'Oren Peli moved to the United States from Israel when he was 19. An intensive studier of animation and graphic design he worked on video games to pay the bills but really wanted to direct and edit feature films so he made it happen. In 2009 he took some inspiration from The Blair Witch Project and made his own firstpersonstyle horror movie Paranormal Activity. The budget was only about $15000 but Peli used his skills as a filmmaker and editor to create terrifying suspense so much so that audiences who caught the movie during its initial limited release created a massive buzz full of stories about theaters full of screaming patrons.',NULL, 'Paranormal Activity:Ghost Dim.', 'Paranormal Activity');

INSERT INTO Wrote
VALUES('Oren Peli', 'Paranormal Activity');

INSERT INTO Actors
VALUES('Katie Featherston', NULL, 'Audiences first caught notice of actress Katie Featherston in 2009, when she appeared in the phenomenally popular independent horror movie Paranormal Activity. After achieving her unexpected fame, she next signed on to appear in the movie Walking Distance.', 'Paranormal Activity 4', 'Paranormal Activity');

INSERT INTO ActedIn
VALUES('Katie Featherston', 'Paranormal Activity');

INSERT INTO ContractedWith
Values('Katie Featherston', 'Paramount Pictures');

INSERT INTO Reviews
VALUES('Paranormal Activity', 83, 83, 89, 204, 169, 35, 57, 57, 57, 273879);

INSERT INTO Movie
VALUES('Overboard', 112, '18-Dec-1987', 'MGM');

INSERT INTO Director
VALUES('Gary Marshall', '13-Nov-1934', 'New York, New York', 'The career of producer director Garry Marshall was marked by many peaks including such classic television sitcoms as The Odd Couple 19701975 Happy Days 19741984 and Mork and Mindy 19781982 and the phenomenally popular feature film Pretty Woman 1990. A Brooklyn native Marshall born Gary Marsciarelli was the son of an industrial filmmaker and a dance instructor.', 'Mothers Day', 'Suzi Q');

INSERT INTO Directed
VALUES('Gary Marshall', 'Overboard');

INSERT INTO WorksFor
VALUES('Gary Marshall', 'MGM');

INSERT INTO Writer
VALUES('Leslie Dixon', NULL, NULL, NULL, 'Look Whos Talking Now', 'Hairspray');

INSERT INTO Wrote
VALUES('Leslie Dixon', 'Overboard');

INSERT INTO Studio
VALUES('MGM');

INSERT INTO Actors
Values('Kurt Russell', '17-Mar-1951', 'One of the most iconic action stars of all time Kurt Russell born March 17th 1951 is among the few to make the successful transition from child star to successful adult actor. As a youth Russell aspired to follow the footsteps of his father Bing Russell who in addition to being a big league baseball player was also an actor he was perhaps best known for his role as the sheriff on the TV Western Bonanza. That his heroes Mickey Mantle and Roger Maris did the same thing only strengthened Russells resolve to have both a baseball and acting career.', 'Winter People', 'TheBatteredBastardsofBaseball');

INSERT INTO ActedIn
VALUES('Kurt Russell', 'Overboard');

INSERT INTO ContractedWith
VALUES('Kurt Russell', 'MGM');

INSERT INTO Reviews
VALUES('Overboard', 42, 42, 25, 31, 13, 18, 74, 74, 74, 68297);

INSERT INTO Movie
VALUES('Psycho', 109, '06-Mar-1960', 'Paramount Pictures');

INSERT INTO Director
VALUES('Alfred Hitchcock', '13-Aug-1899', 'Leytonstone, London', 'Alfred Hitchcock was the most well-known director to the general public by virtue of both his many thrillers and his appearances on television in his own series from the mid-50s through the early 60s. Probably more than any other filmmaker his name evokes instant expectations on the part of audiences: at least two or three great chills and a few more good ones some striking black comedy and an eccentric characterization or two in every one of the directors movies.Originally trained at a technical school Hitchcock gravitated to movies through art courses and advertising and by the mid-20s he was making his first films. He had his first major success in 1926 with The Lodger a thriller loosely based on Jack the Ripper. While he worked in a multitude of genres over the next six years he found his greatest acceptance working with thrillers.', 'The Shame of Mary Boyle', 'Night Will Fall');

INSERT INTO Directed
VALUES('Alfred Hitchcock', 'Psycho');

INSERT INTO WorksFor
VALUES('Alfred Hitchcock', 'Paramount Pictures');

INSERT INTO Writer
VALUES('Joseph Stefano', NULL, NULL, NULL, 'The Black Orchid', 'Psycho');

INSERT INTO Wrote
VALUES('Joseph Stefano', 'Psycho');

INSERT INTO Actors
VALUES('Anthony Perkins', '4-Apr-1932', 'An shy slender actor whose name became virtually synonymous with legendary screen Psycho Norman Bates despite numerous solid performances in films outside the Hitchcock originated series Anthony Perkins sensitive and versatile early performances remain unfortunately obscured by his portrayal of the genderbending sociopath that made filmgoers reluctant to shower alone for decades to come. Born to actor Osgood Perkins in April 1932 who would die when Tony was but five years old the young Perkins decided to follow in his fathers footsteps when at age 15 he became a member of the Actors Equity.', 'Five Miles to Midnight', 'Pretty Poison');

INSERT INTO ActedIn
VALUES('Anthony Perkins', 'Psycho');

INSERT INTO ContractedWith
VALUES('Anthony Perkins', 'Paramount Pictures');

INSERT INTO Reviews
VALUES('Psycho', 95, 95, 91, 97, 92, 5, 95, 95, 95, 239914);

INSERT INTO Genre
VALUES('Fatal Attraction','Drama');

INSERT INTO Genre
VALUES('12 Monkeys','Drama');

INSERT INTO Genre
VALUES('Se7en','Drama');

INSERT INTO Genre
VALUES('Rosemarys Baby','Horror');

INSERT INTO Genre
VALUES('Pulp Fiction','Drama');

INSERT INTO Genre
VALUES('Mulan','Kids \& Family');

INSERT INTO Genre
VALUES('The Blind Side','Comedy');

INSERT INTO Genre
VALUES('Paranormal Activity','Horror');

INSERT INTO Genre
VALUES('Overboard','Comedy');

INSERT INTO Genre
VALUES('Psycho','Horror');

INSERT INTO Genre
VALUES('The Wizard of Oz','Classics');

INSERT INTO Genre
VALUES('Rosemarys Baby','Classics');

INSERT INTO Genre
VALUES('Psycho','Classics');

INSERT INTO Studio
VALUES ('A24');

INSERT INTO Studio
VALUES ('Amazon Studios');

ALTER TABLE Movie
ADD CONSTRAINT Movie_prodstudio_fk FOREIGN KEY(ProdStudio) 
REFERENCES Studio(sName);

ALTER TABLE Genre
ADD CONSTRAINT Genre_mName_fk FOREIGN KEY (mName)
REFERENCES Movie (mName);

ALTER TABLE Directed
ADD CONSTRAINT Directed_dName_fk FOREIGN KEY(dName) 
REFERENCES Director(dName);

ALTER TABLE Directed
ADD CONSTRAINT Directed_mName_fk FOREIGN KEY(mName) 
REFERENCES Movie(mName);

ALTER TABLE WorksFor
ADD CONSTRAINT WorksFor_dName_fk FOREIGN KEY(dName) 
REFERENCES Director(dName);

ALTER TABLE WorksFor
ADD CONSTRAINT WorksFor_sName_fk FOREIGN KEY(sName) 
REFERENCES Studio(sName);

ALTER TABLE Wrote
ADD CONSTRAINT Wrote_wname_fk FOREIGN KEY(wName) 
REFERENCES Writer(wName);

ALTER TABLE Wrote
ADD CONSTRAINT Wrote_mName_fk FOREIGN KEY(mName) 
REFERENCES Movie(mName);

ALTER TABLE ActedIn
ADD CONSTRAINT 	Actedin_mName_fk FOREIGN KEY(mName) 
REFERENCES Movie(mName);

ALTER TABLE ActedIn
ADD CONSTRAINT Actedin_aName_fk FOREIGN KEY(aName)
REFERENCES Actors(aName);

ALTER TABLE ContractedWith
ADD CONSTRAINT Contractedwith_aname_fk FOREIGN KEY(aName) 
REFERENCES Actors(aName);

ALTER TABLE ContractedWith
ADD CONSTRAINT Contractedwith_sName_fk FOREIGN KEY(sName) 
REFERENCES Studio(sName);

ALTER TABLE Reviews
ADD CONSTRAINT Reviews_mName_fk FOREIGN KEY (mName) 
REFERENCES Movie(mName);